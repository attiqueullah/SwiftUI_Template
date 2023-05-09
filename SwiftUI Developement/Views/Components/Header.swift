//
//  Header.swift
//  SwiftUI Developement
//
//  Created by Attique Ullah on 08/05/2023.
//

import SwiftUI

struct Header: View {
    var title: String
    var body: some View {
        Text(title)
            .foregroundColor(Asset.Colors.blackTextColor.swiftUIColor)
            .font(.custom(FontFamily.SFProDisplay.semibold, size: 20))
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(title: L10n.currentBlance)
    }
}
