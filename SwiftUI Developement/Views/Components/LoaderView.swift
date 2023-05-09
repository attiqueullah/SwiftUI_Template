//
//  LoaderView.swift
//  SwiftUI Developement
//
//  Created by Attique Ullah on 08/05/2023.
//

import SwiftUI

struct LoaderView: View {
    let isFailed: Bool
    var body: some View {
        Text(isFailed ? L10n.Failed.tapToRetry : L10n.loading)
            .foregroundColor(isFailed ? .red : .green)
            .padding()
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView(isFailed: false)
    }
}
