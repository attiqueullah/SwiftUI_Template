//
//  CardDetailHeader.swift
//  SwiftUI Developement
//
//  Created by Attique Ullah on 08/05/2023.
//

import SwiftUI

struct CardDetailHeader: View {
    let transaction: Transaction
    var body: some View {
        VStack(content: {
            transaction.icon
            Text(transaction.transactionName)
                .foregroundColor(Asset.Colors.blackTextColor.swiftUIColor)
                .font(.custom(FontFamily.SFProDisplay.regular, size: 17))
            Text(transaction.transactionAmount)
                .foregroundColor(Asset.Colors.blackTextColor.swiftUIColor)
                .font(.custom(FontFamily.SFProDisplay.bold, size: 34))
            if transaction.bird ?? false {
                Text(L10n.congratulationsOnEarningYourBird)
                    .foregroundColor(Asset.Colors.grey828282.swiftUIColor)
                    .font(.custom(FontFamily.SFProDisplay.regular, size: 13))
            }

        })
        .padding([.top, .bottom], 32)
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0
            )
        .background(Asset.Colors.greyBack.swiftUIColor)
        .cornerRadius(12)
    }
}

struct CardDetailHeader_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailHeader(transaction: Transaction(id: "0",
                                                  title: "Starbucks",
                                                  status: "Completed",
                                                  date: "2021-07-26",
                                                  amount: -10.54, bird: true))
    }
}
