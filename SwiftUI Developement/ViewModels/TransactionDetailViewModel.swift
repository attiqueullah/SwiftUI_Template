//
//  TransactionDetailViewModel.swift
//  SwiftUI Developement
//
//  Created by Attique Ullah on 08/05/2023.
//

import Foundation
import Combine

final class TransactionDetailViewModel: BaseViewModel {
    @Published private(set) var transaction: RewardsState = .idle
    private var cancellables: [AnyCancellable] = []

    init(id: String) {
        super.init()
        fetch(id: id)
    }
    private func fetch(id: String) {
        guard id.count > 0 else {
            return
        }
        let output = transform(id: id)
        output.sink(receiveValue: {[unowned self] state in
            self.transaction = state
        }).store(in: &cancellables)
    }
    private func transform(id: String) -> RewardsViewModelOuput {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()

        let details = self.repository.transactionsDetails(id: id)
            .map({ result -> RewardsState in
                switch result {
                case .success(let transaction): return .list(transaction)
                case .failure(let error): return .failure(error)
                }
            })

        let initialState: RewardsViewModelOuput = .just(.loading)

        return Publishers.Merge(initialState, details).removeDuplicates().eraseToAnyPublisher()
    }
}
