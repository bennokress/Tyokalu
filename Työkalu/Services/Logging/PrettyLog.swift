//
// 📄 PrettyLog.swift
// 👨🏼‍💻 Author: Benno Kress
//

import Foundation

// Using exported imports removes the need to import the Logging Package in basically every single file of the app
@_exported import PrettyLog

private extension Array where Element == LogTarget {

    static var defaultLogTargets: Self = [Console()]

}

extension LogCategory {

    static var intent: LogCategory {
        .custom("Intent")
    }

}

/// Log a statement with DEBUG level
/// - Parameters:
///     - messages: One or more strings and string-convertible objects to include in the log statement
///     - sensitiveMessages: One or more strings and string-convertible objects to include in the log statement if the target allows sensitive content
///     - separator: The separator between messages (defaults to `-`)
///     - category: The category of the log message (defaults to `.uncategorized`)
/// - Attention: No log will be created, if `messages` and `sensitiveMessages` are both empty or consist only of `nil`-elements!
public func logD(_ messages: String?..., sensitiveMessages: String?..., joinedBy separator: String = " - ", category: LogCategory = .uncategorized) {
    PrettyLogProxy.logD(messages, sensitiveMessages: sensitiveMessages, joinedBy: separator, category: category, to: .defaultLogTargets)
}

/// Log a statement with DEBUG level
/// - Parameters:
///     - messages: One or more strings and string-convertible objects to include in the log statement
///     - separator: The separator between messages (defaults to `-`)
///     - category: The category of the log message (defaults to `.uncategorized`)
/// - Attention: No log will be created, if `messages`is empty or consist sonly of `nil`-elements!
public func logD(_ messages: String?..., joinedBy separator: String = " - ", category: LogCategory = .uncategorized) {
    PrettyLogProxy.logD(messages, joinedBy: separator, category: category, to: .defaultLogTargets)
}

/// Log a statement with VERBOSE level
/// - Parameters:
///     - messages: One or more strings and string-convertible objects to include in the log statement
///     - sensitiveMessages: One or more strings and string-convertible objects to include in the log statement if the target allows sensitive content
///     - separator: The separator between messages (defaults to `-`)
///     - category: The category of the log message (defaults to `.uncategorized`)
/// - Attention: No log will be created, if `messages` and `sensitiveMessages` are both empty or consist only of `nil`-elements!
public func logV(_ messages: String?..., sensitiveMessages: String?..., joinedBy separator: String = " - ", category: LogCategory = .uncategorized) {
    PrettyLogProxy.logV(messages, sensitiveMessages: sensitiveMessages, joinedBy: separator, category: category, to: .defaultLogTargets)
}

/// Log a statement with VERBOSE level
/// - Parameters:
///     - messages: One or more strings and string-convertible objects to include in the log statement
///     - separator: The separator between messages (defaults to `-`)
///     - category: The category of the log message (defaults to `.uncategorized`)
/// - Attention: No log will be created, if `messages`is empty or consist sonly of `nil`-elements!
public func logV(_ messages: String?..., joinedBy separator: String = " - ", category: LogCategory = .uncategorized) {
    PrettyLogProxy.logV(messages, joinedBy: separator, category: category, to: .defaultLogTargets)
}

/// Log a statement with INFO level
/// - Parameters:
///     - messages: One or more strings and string-convertible objects to include in the log statement
///     - sensitiveMessages: One or more strings and string-convertible objects to include in the log statement if the target allows sensitive content
///     - separator: The separator between messages (defaults to `-`)
///     - category: The category of the log message (defaults to `.uncategorized`)
/// - Attention: No log will be created, if `messages` and `sensitiveMessages` are both empty or consist only of `nil`-elements!
public func logI(_ messages: String?..., sensitiveMessages: String?..., joinedBy separator: String = " - ", category: LogCategory = .uncategorized) {
    PrettyLogProxy.logI(messages, sensitiveMessages: sensitiveMessages, joinedBy: separator, category: category, to: .defaultLogTargets)
}

/// Log a statement with INFO level
/// - Parameters:
///     - messages: One or more strings and string-convertible objects to include in the log statement
///     - separator: The separator between messages (defaults to `-`)
///     - category: The category of the log message (defaults to `.uncategorized`)
/// - Attention: No log will be created, if `messages`is empty or consist sonly of `nil`-elements!
public func logI(_ messages: String?..., joinedBy separator: String = " - ", category: LogCategory = .uncategorized) {
    PrettyLogProxy.logI(messages, joinedBy: separator, category: category, to: .defaultLogTargets)
}

/// Log a statement with WARNING level
/// - Parameters:
///     - messages: One or more strings and string-convertible objects to include in the log statement
///     - sensitiveMessages: One or more strings and string-convertible objects to include in the log statement if the target allows sensitive content
///     - separator: The separator between messages (defaults to `-`)
///     - category: The category of the log message (defaults to `.uncategorized`)
/// - Attention: No log will be created, if `messages` and `sensitiveMessages` are both empty or consist only of `nil`-elements!
public func logW(_ messages: String?..., sensitiveMessages: String?..., joinedBy separator: String = " - ", category: LogCategory = .uncategorized) {
    PrettyLogProxy.logW(messages, sensitiveMessages: sensitiveMessages, joinedBy: separator, category: category, to: .defaultLogTargets)
}

/// Log a statement with WARNING level
/// - Parameters:
///     - messages: One or more strings and string-convertible objects to include in the log statement
///     - separator: The separator between messages (defaults to `-`)
///     - category: The category of the log message (defaults to `.uncategorized`)
/// - Attention: No log will be created, if `messages`is empty or consist sonly of `nil`-elements!
public func logW(_ messages: String?..., joinedBy separator: String = " - ", category: LogCategory = .uncategorized) {
    PrettyLogProxy.logW(messages, joinedBy: separator, category: category, to: .defaultLogTargets)
}

/// Log a statement with ERROR level
/// - Parameters:
///     - messages: One or more strings and string-convertible objects to include in the log statement
///     - sensitiveMessages: One or more strings and string-convertible objects to include in the log statement if the target allows sensitive content
///     - separator: The separator between messages (defaults to `-`)
///     - category: The category of the log message (defaults to `.uncategorized`)
/// - Attention: No log will be created, if `messages` and `sensitiveMessages` are both empty or consist only of `nil`-elements!
public func logE(_ messages: String?..., sensitiveMessages: String?..., joinedBy separator: String = " - ", category: LogCategory = .uncategorized) {
    PrettyLogProxy.logE(messages, sensitiveMessages: sensitiveMessages, joinedBy: separator, category: category, to: .defaultLogTargets)
}

/// Log a statement with ERROR level
/// - Parameters:
///     - messages: One or more strings and string-convertible objects to include in the log statement
///     - separator: The separator between messages (defaults to `-`)
///     - category: The category of the log message (defaults to `.uncategorized`)
/// - Attention: No log will be created, if `messages`is empty or consist sonly of `nil`-elements!
public func logE(_ messages: String?..., joinedBy separator: String = " - ", category: LogCategory = .uncategorized) {
    PrettyLogProxy.logE(messages, joinedBy: separator, category: category, to: .defaultLogTargets)
}

/// Log an `Error` with ERROR level.
/// - Parameters:
///     - error: The error to log
///     - level: The level to log with (defaults to `.error`)
///     - category: The category of the log message (defaults to `.uncategorized`)
/// - Attention: No log will be created, if `error` is `nil`.
public func log(_ error: Error?, as level: LogLevel = .error, category: LogCategory = .uncategorized) {
    PrettyLogProxy.log(error, as: level, category: category, to: .defaultLogTargets)
}

/// Log a `NSException` with ERROR level.
/// - Parameters:
///     - exception: The exception to log
///     - level: The level to log with (defaults to `.error`)
///     - category: The category of the log message (defaults to `.uncategorized`)
/// - Attention: No log will be created, if `exception` is `nil`.
public func log(_ exception: NSException?, as level: LogLevel = .error, category: LogCategory = .uncategorized) {
    PrettyLogProxy.log(exception, as: level, category: category, to: .defaultLogTargets)
}

/// Log with ERROR level and crash the app.
/// - Parameters:
///     - messages: One or more strings and string-convertible objects to include in the log statement
///     - sensitiveMessages: One or more strings and string-convertible objects to include in the log statement if the target allows sensitive content
///     - separator: The separator between messages (defaults to `-`)
///     - category: The category of the log message
/// - Attention: No log will be created, if `messages` and `sensitiveMessages` are both empty or consist only of `nil`-elements!
func fatalLog(_ messages: String?..., sensitiveMessages: String?..., joinedBy separator: String = " - ", category: LogCategory = .uncategorized) -> Never {
    PrettyLogProxy.logE(messages, sensitiveMessages: sensitiveMessages, joinedBy: separator, category: category, to: .defaultLogTargets)
    let messageComponents = messages.compactMap { $0 } + sensitiveMessages.compactMap { $0 }
    let statement = messageComponents.joined(separator: separator).replacedWithNilIfEmpty ?? ""
    fatalError(statement)
}

/// Log with ERROR level and crash the app.
/// - Parameters:
///     - messages: One or more strings and string-convertible objects to include in the log statement
///     - separator: The separator between messages (defaults to `-`)
///     - category: The category of the log message
/// - Attention: No log will be created, if `messages`is empty or consist sonly of `nil`-elements!
func fatalLog(_ messages: String?..., joinedBy separator: String = " - ", category: LogCategory = .uncategorized) -> Never {
    PrettyLogProxy.logE(messages, joinedBy: separator, category: category, to: .defaultLogTargets)
    let messageComponents = messages.compactMap { $0 }
    let statement = messageComponents.joined(separator: separator).replacedWithNilIfEmpty ?? ""
    fatalError(statement)
}
