//
//  States.swift
//  SwiftUI Developement
//
//  Created by Attique Ullah on 09/05/2023.
//

import Foundation
import Combine

typealias RewardsViewModelOuput = AnyPublisher<RewardsState, Never>
enum RewardsState {
    
    case idle
    case loading
    case success(RewardsInfo)
    case list(Transaction)
    case failure(NetworkError)
    
}
extension RewardsState: Equatable {
    
    static func == (lhs: RewardsState, rhs: RewardsState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.success(let lhs), .success(let rhs)):
            return lhs == rhs
        case (.failure, .failure):
            return true
        default: return false
        }
    }
    
}
