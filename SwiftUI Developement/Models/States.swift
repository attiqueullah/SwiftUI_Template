//
//  States.swift
//  SwiftUI Developement
//
//  Created by Attique Ullah on 09/05/2023.
//

import Foundation
import Combine

typealias RewardsViewModelOuput = AnyPublisher<RewardsState, Never>
typealias TransactionViewModelOuput = AnyPublisher<TransactionState, Never>
enum RewardsState {
    case idle
    case loading
    case success(RewardsInfo)
    case failure(NetworkError)
}
enum TransactionState {
    case idle
    case loading
    case success(Transaction)
    case failure(NetworkError)
}
extension RewardsState: Equatable {
    static func == (lhs: RewardsState, rhs: RewardsState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading): return true
        case (.success(let lhsMovies), .success(let rhsMovies)): return lhsMovies == rhsMovies
        case (.failure, .failure): return true
        default: return false
        }
    }
}
extension TransactionState: Equatable {
    static func == (lhs: TransactionState, rhs: TransactionState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading): return true
        case (.success(let lhsMovies), .success(let rhsMovies)): return lhsMovies == rhsMovies
        case (.failure, .failure): return true
        default: return false
        }
    }
}
