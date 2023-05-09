//
//  RewardDetailCell.swift
//  SwiftUI Developement
//
//  Created by Attique Ullah on 08/05/2023.
//

import SwiftUI

struct RewardDetailCell: View {
    let label: String
    let value: String
    var body: some View {
        HStack(alignment: .center) {
            Text(label)
                .foregroundColor(Asset.Colors.blackTextColor.swiftUIColor)
                .font(.custom(FontFamily.SFProDisplay.regular, size: 17))
            Spacer()
            Text(value)
                .foregroundColor(Asset.Colors.seperator.swiftUIColor)
                .font(.custom(FontFamily.SFProDisplay.regular, size: 17))
                .padding([.trailing], 12)
        }
        .frame(height: 44)
    }
}

struct RewardDetailCell_Previews: PreviewProvider {
    static var previews: some View {
        RewardDetailCell(label: "Status", value: "Completed")
    }
}
