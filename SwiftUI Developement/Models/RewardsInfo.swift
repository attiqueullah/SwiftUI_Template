//
//  RewardsInfo.swift
//  SwiftUI Developement
//
//  Created by Attique Ullah on 07/05/2023.
//

import Foundation
import SwiftDate
import SwiftUI
import Combine

// MARK: - Reward
struct RewardsInfo: Codable, Equatable {
    let cardNumber, cardExpirationDate: String?
    let balance: Double?
    var transactions: [Transaction]?
}

// MARK: - Transaction
struct Transaction: Codable, Identifiable, Equatable {
    let id, title, status, date: String?
    let amount: Double?
    let bird: Bool?
}


extension Transaction {
    var transactionName: String {
        title ?? ""
    }
    var transactionAmount: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US") // Set the locale to your desired currency

        return formatter.string(from: NSNumber(value: Double(amount ?? 0.0))) ?? ""
    }
    var transactionDate: String {
        date?.toDate()?.toString(.dateTimeMixed(dateStyle: .medium, timeStyle: .none)) ?? ""
    }
    var icon: Image {
        bird ?? false ? Asset.Assets.birdLarge.swiftUIImage : Asset.Assets.noBird.swiftUIImage
    }
}
extension RewardsInfo {
    var cNumber: String {
        "**** \(cardNumber ?? "")"
    }
    var expiry: String {
        "\((cardExpirationDate?.toDate()?.day ?? 0) % 100)/\((cardExpirationDate?.toDate()?.year ?? 0) % 100)"
    }
}
