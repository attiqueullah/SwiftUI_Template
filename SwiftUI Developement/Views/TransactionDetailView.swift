//
//  TransactionDetailView.swift
//  SwiftUI Developement
//
//  Created by Attique Ullah on 08/05/2023.
//

import SwiftUI
import AlertToast
struct TransactionDetailView: View {
    
    @ObservedObject private var viewModel: TransactionDetailViewModel
    init(viewModel: TransactionDetailViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        switch viewModel.transaction {
        case .idle:
            EmptyView()
        case .loading:
            ProgressView("Please wait…")
        case .success:
            EmptyView()
        case .list(let transaction):
            transactionDetails(transaction: transaction)
        case .failure(let error):
            AlertToast(type: .error(.accentColor), title: error.localizedDescription)
        }
    }

    func transactionDetails(transaction: Transaction) -> some View {
        VStack(spacing: 16) {
            CardDetailHeader(transaction: transaction)
            RewardDetails(transaction: transaction)
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding([.leading, .trailing], 16)
    }
    
}

struct TransactionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionDetailView(viewModel: TransactionDetailViewModel(id: ""))
    }
}
