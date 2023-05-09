//
//  TransactionListView.swift
//  SwiftUI Developement
//
//  Created by Attique Ullah on 08/05/2023.
//

import SwiftUI

struct TransactionListView: View {
    var viewModel: RewardsViewModel
    var transactions: [Transaction]
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Header(title: L10n.latestTransactions)
            LazyVStack(alignment: .center, spacing: 1.0) {
                ForEach(transactions, id: \.id) { transaction in
                    NavigationLink(destination:
                                    viewModel.transactionDetailViewModel(id: transaction.id ?? "")) {
                        TransactionCell(transaction: transaction)
                        }
                }
                LoaderView(isFailed: viewModel.isRequestFailed)
                    .onAppear(perform: fetchData)
                    .onTapGesture(perform: onTapLoadView)

            }
            .background(Asset.Colors.greyBack.swiftUIColor)
            .cornerRadius(12)

        }
        .padding([.leading, .trailing], 16)
    }
    private func fetchData() {
        viewModel.loadTransactions()
    }

    private func onTapLoadView() {
        // enable tap to reload
        if viewModel.isRequestFailed {
            viewModel.isRequestFailed = false
            fetchData()
        }
    }
}

struct TransactionListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionListView(viewModel: RewardsViewModel(),
                            transactions: [
                                Transaction(id: "0",
                                            title: "Starbucks",
                                            status: nil,
                                            date: "2021-07-26",
                                            amount: -10.54,
                                            bird: true)
                            ])
    }
}
