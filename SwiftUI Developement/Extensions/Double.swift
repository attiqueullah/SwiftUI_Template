//
//  Double.swift
//  SwiftUI Developement
//
//  Created by Attique Ullah on 08/05/2023.
//

import Foundation
extension Double {
    var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        return formatter
    }

    func currency() -> String {
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
