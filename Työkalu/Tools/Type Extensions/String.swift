//
// 📄 String.swift
// 👨🏼‍💻 Author: Benno Kress
//

import Foundation

extension String {

    /// Joins all the given Strings with the given separator
    /// - Parameters:
    ///   - separator: The separator to use in between the given Strings.
    ///   - strings: The Strings to join together.
    /// - Returns: The joined String
    static func joined(with separator: String = "", combining strings: String?...) -> String {
        let stringComponents = strings.compactMap { $0 }
        return stringComponents.joined(separator: separator)
    }

    /// Returns `nil` if the String is empty
    nonisolated var replacedWithNilIfEmpty: String? {
        isEmpty ? nil : self
    }

}
