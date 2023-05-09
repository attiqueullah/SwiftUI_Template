// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  /// **** 9901
  public static let _9901 = L10n.tr("Localizable", "**** 9901", fallback: "**** 9901")
  /// 12/23
  public static let _1223 = L10n.tr("Localizable", "12/23", fallback: "12/23")
  /// Balance as of July 26, 2021
  public static let balanceAsOfJuly262021 = L10n.tr("Localizable", "Balance as of July 26, 2021", fallback: "Balance as of July 26, 2021")
  /// Congratulations on earning your bird!
  public static let congratulationsOnEarningYourBird = L10n.tr("Localizable", "Congratulations on earning your bird!", fallback: "Congratulations on earning your bird!")
  /// Current Blance
  public static let currentBlance = L10n.tr("Localizable", "Current Blance", fallback: "Current Blance")
  /// Date
  public static let date = L10n.tr("Localizable", "Date", fallback: "Date")
  /// Expiration date
  public static let expirationDate = L10n.tr("Localizable", "Expiration date", fallback: "Expiration date")
  /// Latest Transactions
  public static let latestTransactions = L10n.tr("Localizable", "Latest Transactions", fallback: "Latest Transactions")
  /// Loading..
  public static let loading = L10n.tr("Localizable", "Loading..", fallback: "Loading..")
  /// Localizable.strings
  ///   SwiftUI Developement
  /// 
  ///   Created by Attique Ullah on 07/05/2023.
  public static let rewards = L10n.tr("Localizable", "Rewards", fallback: "Rewards")
  /// Status
  public static let status = L10n.tr("Localizable", "Status", fallback: "Status")
  /// Transactions Details
  public static let transactionsDetails = L10n.tr("Localizable", "Transactions Details", fallback: "Transactions Details")
  public enum Failed {
    /// Failed. Tap to retry.
    public static let tapToRetry = L10n.tr("Localizable", "Failed. Tap to retry.", fallback: "Failed. Tap to retry.")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
