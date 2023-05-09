//
//  TransactionCell.swift
//  SwiftUI Developement
//
//  Created by Attique Ullah on 07/05/2023.
//

import SwiftUI

struct TransactionCell: View {
    let transaction: Transaction
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack(spacing: 4) {
                Text(transaction.transactionName)
                    .foregroundColor(Asset.Colors.blackTextColor.swiftUIColor)
                    .font(.custom(FontFamily.SFProDisplay.semibold, size: 15))
                if transaction.bird ?? false {
                    Asset.Assets.bird.swiftUIImage
                }
                Spacer()
                Text(transaction.transactionAmount)
                    .foregroundColor(Asset.Colors.blackTextColor.swiftUIColor)
                    .font(.custom(FontFamily.SFProDisplay.semibold, size: 15))
                Image(systemName: "chevron.right")
                    .foregroundColor(Color.gray)
            }
            .padding([.trailing], 12)
            Text(transaction.transactionDate)
                .foregroundColor(Asset.Colors.grey85.swiftUIColor)
                .font(.custom(FontFamily.SFProDisplay.regular, size: 11))

            Divider()
                .background(Asset.Colors.divider.swiftUIColor)
                .padding([.top], 12)
        }
        .padding([.leading, .top], 12)
        .frame(height: 58)

    }
}

struct TransactionCell_Previews: PreviewProvider {
    static var previews: some View {
        TransactionCell(transaction:
                            Transaction(id: "0",
                                        title: "Starbucks",
                                        status: nil,
                                        date: "2021-07-26",
                                        amount: -10.54, bird: true))
    }
}
