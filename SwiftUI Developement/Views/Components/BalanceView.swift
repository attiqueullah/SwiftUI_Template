//
//  BalanceView.swift
//  SwiftUI Developement
//
//  Created by Attique Ullah on 07/05/2023.
//

import SwiftUI

struct BalanceView: View {
    var balance: String
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Header(title: L10n.currentBlance)
            RoundedRectangle(cornerRadius: 12)
                .fill(Asset.Colors.greyBack.swiftUIColor)
                .overlay(alignment: .leading, content: {
                    balanceInfo
                })
                .frame(height: 77)
        }
        .padding([.leading, .trailing], 16)
    }
    var balanceInfo: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Text(L10n.balanceAsOfJuly262021)
                .foregroundColor(Asset.Colors.grey85.swiftUIColor)
                .font(.custom(FontFamily.SFProDisplay.semibold, size: 11))
            Text(balance)
                .foregroundColor(Asset.Colors.blackTextColor.swiftUIColor)
                .font(.custom(FontFamily.SFProDisplay.semibold, size: 30))
        }
        .padding(12.0)
    }
}

struct BalanceView_Previews: PreviewProvider {
    static var previews: some View {
        BalanceView(balance: "139.48")
    }
}
