//
//  Repository.swift
//  Oogoo
//
//  Created by Attique Ullah on 29/12/2022.
//

import Foundation
import Combine
import UIKit

protocol Repository: AutoMockable {
    func rewardInfo() -> AnyPublisher<Result<RewardsInfo, NetworkError>, Never>
    func transactions() -> AnyPublisher<Result<[Transaction], NetworkError>, Never>
    func transactionsDetails(id: String) -> AnyPublisher<Result<Transaction, NetworkError>, Never>
}
final class OfflineRepository: Repository {
    private let networkService: NetworkServiceType

    init(networkService: NetworkServiceType) {
        self.networkService = networkService
    }
    func rewardInfo() -> AnyPublisher<Result<RewardsInfo, NetworkError>, Never> {
        return networkService
            .load(Resource<RewardsInfo>.rewardInfo())
            .map { .success($0) }
            .catch { error -> AnyPublisher<Result<RewardsInfo, NetworkError>, Never> in .just(.failure(error)) }
            .subscribe(on: Scheduler.backgroundWorkScheduler)
            .receive(on: Scheduler.mainScheduler)
            .eraseToAnyPublisher()
    }
    func transactions() -> AnyPublisher<Result<[Transaction], NetworkError>, Never> {
        return networkService
            .load(Resource<[Transaction]>.transactions())
            .map { .success($0) }
            .catch { error -> AnyPublisher<Result<[Transaction], NetworkError>, Never> in .just(.failure(error)) }
            .subscribe(on: Scheduler.backgroundWorkScheduler)
            .receive(on: Scheduler.mainScheduler)
            .eraseToAnyPublisher()
    }
    func transactionsDetails(id: String) -> AnyPublisher<Result<Transaction, NetworkError>, Never> {
        return networkService
            .load(Resource<Transaction>.transactionDetails(id: id))
            .map { .success($0) }
            .catch { error -> AnyPublisher<Result<Transaction, NetworkError>, Never> in .just(.failure(error)) }
            .subscribe(on: Scheduler.backgroundWorkScheduler)
            .receive(on: Scheduler.mainScheduler)
            .eraseToAnyPublisher()
    }
}
