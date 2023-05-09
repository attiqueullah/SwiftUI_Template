//
//  RewardsInfoView.swift
//  SwiftUI Developement
//
//  Created by Attique Ullah on 08/05/2023.
//

import SwiftUI

struct RewardsInfoView: View {
    var reward: RewardsInfo
    var viewModel: RewardsViewModel

    var body: some View {
        ScrollView(content: {
            VStack(spacing: 16, content: {
                CardView(reward: reward)
                BalanceView(balance: reward.balance?.currency() ?? "")
                TransactionListView(viewModel: viewModel, transactions: reward.transactions ?? [])
            })
        })
        .gesture(
           DragGesture().onChanged { _ in

           }
        )
    }
}

struct RewardsInfoView_Previews: PreviewProvider {
    static var previews: some View {
        RewardsInfoView(reward:
                            RewardsInfo(cardNumber: "N10D54V321",
                                        cardExpirationDate: "2023-12",
                                        balance: 10.00,
                                        transactions: []), viewModel: RewardsViewModel())
    }
}
