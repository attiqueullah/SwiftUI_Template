//
//  NetworkService.swift
//  TMDB
//
//  Created by Maksym Shcheglov on 05/10/2019.
//  Copyright © 2019 Maksym Shcheglov. All rights reserved.
//

import Foundation
import Combine

final class NetworkService: NetworkServiceType {
    private let session: URLSession

    init(session: URLSession = URLSession(configuration: URLSessionConfiguration.ephemeral)) {
        self.session = session
    }

    @discardableResult
    func load<T>(_ resource: Resource<T>) -> AnyPublisher<T, NetworkError> {
        guard let request = resource.request else {
            return .fail(NetworkError.invalidRequest)
        }
        return session.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NetworkError.invalidResponse
                }
                guard 200..<300 ~= httpResponse.statusCode else {
                    throw NetworkError.invalidResponse
                }
                return try JSONDecoder().decode(T.self, from: data)
            }
            .mapError { error -> NetworkError in
                switch error {
                case is DecodingError:
                    return NetworkError.jsonDecodingError(error: error)
                default:
                    return NetworkError.network(description: "")
                }
            }
            .eraseToAnyPublisher()
    }

}
