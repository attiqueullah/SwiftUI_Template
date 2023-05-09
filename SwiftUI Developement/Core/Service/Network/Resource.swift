//
//  Resource.swift
//  TMDB
//
//  Created by Maksym Shcheglov on 05/10/2019.
//  Copyright © 2019 Maksym Shcheglov. All rights reserved.
//

import Foundation

enum Method: String {
    case GET
    case POST
    case PUT
}
struct Resource<T: Decodable> {
    let url: URL
    let parameters: [String: CustomStringConvertible]
    let body: Data
    let method: Method

    var request: URLRequest? {
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return nil
        }

        guard let url = components.url else {
            return nil
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        if method == .POST || method == .PUT {
            request.httpBody = body
        } else {
            components.queryItems = parameters.keys.map { key in
                URLQueryItem(name: key, value: parameters[key]?.description)
            }
        }

        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        return request
    }

    init(url: URL, parameters: [String: CustomStringConvertible] = [:], body: Data? = nil, type: Method = .POST) {
        self.url = url
        self.parameters = parameters
        self.body = body ?? Data()
        self.method = type
    }
}
extension Resource {
    static func rewardInfo() -> Resource<RewardsInfo> {
        let url = URL(string: Config.apiHost + "rewards")!
        return Resource<RewardsInfo>(url: url, type: .GET)
    }
    static func transactions() -> Resource<[Transaction]> {
        let url = URL(string: Config.apiHost + "rewards/transactions")!
        return Resource<[Transaction]>(url: url, type: .GET)
    }
    static func transactionDetails(id: String) -> Resource<Transaction> {
        let url = URL(string: Config.apiHost + "rewards/transactions/\(id)")!
        return Resource<Transaction>(url: url, type: .GET)
    }
}
