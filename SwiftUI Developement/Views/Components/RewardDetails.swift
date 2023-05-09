//
//  RewardDetails.swift
//  SwiftUI Developement
//
//  Created by Attique Ullah on 08/05/2023.
//

import SwiftUI

struct RewardDetails: View {
    let transaction: Transaction
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Header(title: L10n.transactionsDetails)
            RoundedRectangle(cornerRadius: 12)
                .fill(Asset.Colors.greyBack.swiftUIColor)
                .overlay(alignment: .leading, content: {
                    VStack(alignment: .leading, spacing: 4.0) {
                        RewardDetailCell(label: L10n.status, value: transaction.status ?? "")
                        Divider()
                        RewardDetailCell(label: L10n.date, value: transaction.transactionDate)
                    }
                    .padding([.leading, .top, .bottom], 12)

                })
                .frame(height: 90)
        }
    }
}

struct RewardDetails_Previews: PreviewProvider {
    static var previews: some View {
        RewardDetails(transaction:
                        Transaction(id: "0",
                                    title: "Starbucks",
                                    status: "Completed",
                                    date: "2021-07-26",
                                    amount: -10.54, bird: true))
    }
}
