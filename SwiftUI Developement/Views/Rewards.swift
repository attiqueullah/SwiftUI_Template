//
//  Rewards.swift
//  SwiftUI Developement
//
//  Created by Attique Ullah on 07/05/2023.
//

import SwiftUI
import AlertToast
struct Rewards: View {
    @ObservedObject private var viewModel: RewardsViewModel
    init(viewModel: RewardsViewModel = RewardsViewModel()) {
        self.viewModel = viewModel
    }
    var body: some View {
        NavigationView(content: {
            VStack(content: {
                switch viewModel.rewards {
                case .idle: EmptyView()
                case .loading: ProgressView("Please wait…")
                case .success(let reward): RewardsInfoView(reward: reward, viewModel: viewModel)
                case .failure(let error): AlertToast(type: .error(.accentColor), title: error.localizedDescription)
                }
            })
            .navigationTitle(L10n.rewards)
        })

    }
}

struct Rewards_Previews: PreviewProvider {
    static var previews: some View {
        Rewards()
    }
}
