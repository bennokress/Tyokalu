//
// 📄 Console.swift
// 👨🏼‍💻 Author: Benno Kress
//

import Foundation
import PrettyLog

struct Console: LogTarget {

    let canLogSensitiveInformation = true

    func createLog(_ level: LogLevel, message: String, category: LogCategory) {
        print(String.joined(with: " ", combining: prefix(level: level, category: category), message))
    }

    var logPriorityRange: ClosedRange<LogLevel>? {
        .allowAll
    }

    // MARK: Private Helpers

    private var currentTimestamp: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss.SSS"
        return formatter.string(from: Date())
    }

    private func prefix(level: LogLevel, category: LogCategory) -> String {
        String.joined(with: " ", combining: currentTimestamp, category.truncatedOrPadded(to: 20), level.emoji)
    }

}
