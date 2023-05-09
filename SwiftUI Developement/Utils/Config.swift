//
//  Config.swift
//  SwiftUI Developement
//
//  Created by Attique Ullah on 08/05/2023.
//

import Foundation
public struct Config {

    // Web Services
    internal enum WebService: String {
        case development = "https://ios.rp.devfactory.com/"
    }

    // Defaults
    public static let defaultTargetStepCount = 10000
    public static let defaultCornerRadius: CGFloat = 3.0
    public static let defaultAnimatedTransition: Double = 0.5
    public static let defaultCookieValidDuration: Double = 20.0
    public static let defaultLineHeight: CGFloat = 21.0
    public static let defaultLineHeightLarge: CGFloat = 24.0
    public static let defaultReferralsDollarValue: Int = 10
    public static let defaultAppResumeRefreshDuration = 360 // 6 hours
}

public func delay(_ delay: Double, closure: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        closure()
    }
}

public func mainQueue(_ block: @escaping () -> Void) {
    DispatchQueue.main.async(execute: block)
}

public extension Config {
    // Web Service
    static var apiHost: String {
        return WebService.development.rawValue
    }
}
