//
//  CardView.swift
//  SwiftUI Developement
//
//  Created by Attique Ullah on 07/05/2023.
//

import SwiftUI
import SwiftHEXColors
struct CardView: View {
    var reward: RewardsInfo
    private let gradientColors = [Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.24)),
                                  Color(UIColor(red: 1, green: 1, blue: 1, alpha: 0)),
                                  Color(UIColor(red: 0, green: 0, blue: 0, alpha: 0.24))]
    var body: some View {

        ZStack(alignment: .topLeading) {
            gradient
            Asset.Assets.alphaLogo.swiftUIImage
                .padding([.leading, .top], 12)
            cardInfo
                .padding([.leading, .trailing, .bottom], 12)
        }
        .frame(height: 221)
        .padding([.leading, .trailing], 16)
    }
    var gradient: some View {
        LinearGradient(colors: gradientColors,
                       startPoint: UnitPoint(x: 0.25, y: 0.5),
                       endPoint: UnitPoint(x: 0.75, y: 0.5))
        .blur(radius: 6)
        .overlay(content: {
            Asset.Assets.card.swiftUIImage.resizable()
                .aspectRatio(contentMode: .fill)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white.opacity(0.55), lineWidth: 1)
                })
        })
        .frame(height: 221)
    }
    var cardInfo: some View {
        VStack(alignment: .leading) {
            Spacer()
            cardNumber
            HStack {
                cardExpiry
                Spacer()
                Asset.Assets.visa.swiftUIImage
                    .padding([.trailing, .bottom], 12)
            }
        }
    }
    var cardNumber: some View {
        Text(reward.cNumber)
            .foregroundColor(Color.white)
            .font(.custom(FontFamily.SFProDisplay.bold, size: 22))
            .padding([.bottom], 20)
    }
    var cardExpiry: some View {
        VStack(alignment: .leading) {
            Text(L10n.expirationDate)
                .foregroundColor(Color.white)
                .font(.custom(FontFamily.SFProDisplay.regular, size: 11))
            Text(reward.expiry)
                .foregroundColor(Color.white)
                .font(.custom(FontFamily.SFProDisplay.bold, size: 15))
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(reward: RewardsInfo(cardNumber: "N10D54V321",
                                     cardExpirationDate: "2023-12",
                                     balance: 10.00,
                                     transactions: []))
    }
}
