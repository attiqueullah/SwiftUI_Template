//
//  RewardsViewModel.swift
//  SwiftUI Developement
//
//  Created by Attique Ullah on 07/05/2023.
//

import Foundation
import Combine

final class RewardsViewModel: BaseViewModel {

    @Published private(set) var rewards: RewardsState = .idle
    @Published var isRequestFailed = false
    var rewardsInfo: RewardsInfo?
    var transactions: [Transaction] = []
    private var cancellables: [AnyCancellable] = []

    override init() {
        super.init()
        fetch()
    }

    private func fetch() {
        let output = transform()
        output.sink(receiveValue: {[unowned self] state in
            self.rewards = state
        }).store(in: &cancellables)
    }

    private func transform() -> RewardsViewModelOuput {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()

        let rewardsInfo = self.repository.rewardInfo()
            .map({ result -> RewardsState in
                switch result {
                case .success(let reward):
                    self.rewardsInfo = reward
                    return .success(reward)
                case .failure(let error): return .failure(error)
                }
            })

        let initialState: RewardsViewModelOuput = .just(.loading)

        return Publishers.Merge(initialState, rewardsInfo).removeDuplicates().eraseToAnyPublisher()
    }
    func loadTransactions() {
        let list = self.repository.transactions()
            .map({ result -> RewardsState in
                switch result {
                case .success(let transactions):
                    self.rewardsInfo?.transactions = transactions
                    return .success(self.rewardsInfo!)
                case .failure(let error):
                    self.isRequestFailed = true
                    return .failure(error)
                }
            })
        list.sink(receiveValue: {[unowned self] state in
            self.rewards = state
        }).store(in: &cancellables)
    }
    func transactionDetailViewModel(id: String) -> TransactionDetailView {
        TransactionDetailView(viewModel: TransactionDetailViewModel(id: id))
    }
}
