import Foundation

extension Int {
	var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        return formatter
	}

	func ordinal() -> String {
		return formatter.string(for: self)!
	}
}
