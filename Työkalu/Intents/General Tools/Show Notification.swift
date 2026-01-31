//
// 📄 Show Notification.swift
// 👨🏼‍💻 Author: Benno Kress
//

import AppIntents
import Foundation
import UniformTypeIdentifiers
import UserNotifications

struct ShowNotificationIntent: AppIntent {

    static var title: LocalizedStringResource = "Show Notification"
    static var description = IntentDescription("This action will display a notification on this device.", categoryName: "Device Functionality", searchKeywords: ["push", "alert"])
    static var openAppWhenRun = false
    static var authenticationPolicy: IntentAuthenticationPolicy = .alwaysAllowed

    @Parameter(title: "Title")
    var title: String

    @Parameter(title: "Message")
    var message: String

    @Parameter(title: "Subtitle", description: "The subtitle of the notification (optional)", default: nil)
    var subtitle: String?

    @Parameter(title: "Attachment", description: "An attachment that will be displayed in the notification (optional, see UNNotificationAttachment for more information)", default: nil)
    var attachment: IntentFile?

    @Parameter(title: "Time Sensitive?", description: "Turning this on will allow the notification to break through Focus Modes", default: false)
    var isTimeSensitive: Bool

    @Parameter(title: "Thread ID", description: "Setting a Thread ID will group the notification with other notifications that have the same Thread ID", default: nil)
    var threadID: String?

    @Parameter(title: "Notification ID", description: "Setting a Notification ID will replace any older notification with the same Notification ID", default: nil)
    var notificationID: String?

    @Parameter(title: "Tap Action", description: "What happens when you tap on the notification", default: .nothing)
    var tapAction: LocalNotification.TapAction

    @Parameter(title: "Shortcut Name", description: "The name of the Shortcut to run when the notification is tapped (required if 'Tap Action' is \"Run Shortcut\")", default: nil)
    var tapActionShortcutName: String?

    @Parameter(title: "Shortcut Input Parameter", description: "The (unencoded) input of the Shortcut to run when the notification is tapped (optional)", default: nil)
    var tapActionShortcutInputParameter: String?

    @Parameter(title: "URL", description: "The URL to open when the notification is tapped (required if 'Tap Action' is \"Open URL\")", default: nil)
    var tapActionURL: URL?

    static var parameterSummary: some ParameterSummary {
        Switch(\.$tapAction) {
            Case(.runShortcut) {
                Summary("Show notification with \(\.$title) and \(\.$message)") {
                    \.$tapActionShortcutName
                    \.$tapActionShortcutInputParameter
                    \.$tapAction
                    \.$notificationID
                    \.$threadID
                    \.$isTimeSensitive
                    \.$attachment
                    \.$subtitle
                }
            }
            Case(.openURL) {
                Summary("Show notification with \(\.$title) and \(\.$message)") {
                    \.$tapActionURL
                    \.$tapAction
                    \.$notificationID
                    \.$threadID
                    \.$isTimeSensitive
                    \.$attachment
                    \.$subtitle
                }
            }
            DefaultCase {
                Summary("Show notification with \(\.$title) and \(\.$message)") {
                    \.$tapAction
                    \.$notificationID
                    \.$threadID
                    \.$isTimeSensitive
                    \.$attachment
                    \.$subtitle
                }
            }
        }
    }

    func perform() async throws -> some IntentResult {
        guard await verifyNotificationPermission() else { throw ShowNotificationIntentError.notificatiionPermissionsMissing }
        try verifyParameters()
        let notification = LocalNotification(title: title, subtitle: subtitle, message: message, attachment: attachment, isTimeSensitive: isTimeSensitive, threadID: threadID, notificationID: notificationID, tapAction: tapAction, tapActionShortcutName: tapActionShortcutName, tapActionShortcutInputParameter: tapActionShortcutInputParameter, tapActionURL: tapActionURL)
        try await notification.send()
        notification.deleteAttachmentFromFileSystem()
        return .result()
    }

    private func verifyNotificationPermission() async -> Bool {
        await withCheckedContinuation { continuation in
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                let isNotificationAllowed = settings.authorizationStatus == .authorized || settings.authorizationStatus == .provisional
                continuation.resume(with: .success(isNotificationAllowed))
            }
        }
    }

    private func verifyParameters() throws {
        guard !title.isEmpty else { throw ShowNotificationIntentError.emptyTitle }
        guard !message.isEmpty else { throw ShowNotificationIntentError.emptyMessage }
        switch tapAction {
        case .runShortcut:
            guard let tapActionShortcutName, !tapActionShortcutName.isEmpty else { throw ShowNotificationIntentError.emptyRequiredShortcutName }
            tapActionURL = nil

        case .openURL:
            guard let tapActionURL, !tapActionURL.absoluteString.isEmpty else { throw ShowNotificationIntentError.emptyRequiredURL }
            tapActionShortcutName = nil

        case .nothing:
            tapActionShortcutName = nil
            tapActionURL = nil
        }
    }

}

enum ShowNotificationIntentError: Error, CustomLocalizedStringResourceConvertible {

    case emptyMessage
    case emptyRequiredShortcutName
    case emptyRequiredURL
    case emptyTitle
    case notificatiionPermissionsMissing
    case notificationAttachmentTypeNotSupported(_ type: UTType?)
    case notificationAttachmentTooLarge

    var localizedStringResource: LocalizedStringResource {
        switch self {
        case .emptyMessage: "The notification message can not be empty"
        case .emptyRequiredShortcutName: "The tap action \"Run Shortcut\" requires a valid Shortcut Name"
        case .emptyRequiredURL: "The tap action \"Open URL\" requires a valid URL"
        case .emptyTitle: "The notification title can not be empty"
        case .notificatiionPermissionsMissing: "Työkalu needs permission to send notifications. Please review your settings."
        case let .notificationAttachmentTypeNotSupported(type): type != nil ? "Notifications on iOS do not support attachments of type '\(type!.description)'." : "Notifications on iOS do not support attachments of this type."
        case .notificationAttachmentTooLarge: "Notifications on iOS do not support attachments as large as the one you provided."
        }
    }

}

struct LocalNotification {

    private let title: String
    private let subtitle: String?
    private let message: String
    private let attachment: IntentFile?
    private let isTimeSensitive: Bool
    private let threadID: String
    private let notificationID: String
    private let tapAction: TapAction
    private let tapActionShortcutName: String?
    private let tapActionShortcutInputParameter: String?
    private let tapActionURL: URL?

    private var encodedShortcutName: String? {
        guard let tapActionShortcutName, !tapActionShortcutName.isEmpty else { return nil }
        return tapActionShortcutName.addingPercentEncoding(withAllowedCharacters: .alphanumerics)
    }

    private var encodedShortcutInputParameter: String? {
        guard let tapActionShortcutInputParameter, !tapActionShortcutInputParameter.isEmpty else { return nil }
        return tapActionShortcutInputParameter.addingPercentEncoding(withAllowedCharacters: .alphanumerics)
    }

    private var runShortcutURLString: String? {
        guard let encodedShortcutName else { return nil }
        guard let encodedShortcutInputParameter else { return "shortcuts://run-shortcut?name=\(encodedShortcutName)" }
        return "shortcuts://run-shortcut?name=\(encodedShortcutName)&input=text&text=\(encodedShortcutInputParameter)"
    }

    private var payloadURL: URL {
        let shortcutsAppURL = URL(string: "shortcuts://")!

        switch tapAction {
        case .nothing:
            return shortcutsAppURL

        case .runShortcut:
            guard let runShortcutURLString else { return shortcutsAppURL }
            return URL(string: runShortcutURLString) ?? shortcutsAppURL

        case .openURL:
            return tapActionURL ?? shortcutsAppURL
        }
    }

    private func constructUNNotificationContent() throws -> UNMutableNotificationContent {
        let notification = UNMutableNotificationContent()
        notification.title = title
        if let subtitle { notification.subtitle = subtitle }
        notification.body = message
        notification.threadIdentifier = threadID
        notification.sound = UNNotificationSound.default
        notification.interruptionLevel = isTimeSensitive ? .timeSensitive : .active
        notification.categoryIdentifier = tapAction.categoryIdentifier
        notification.userInfo = ["URL": payloadURL.absoluteString]
        if let attachmentURL = try attachment?.storeAsNotificationAttachment() {
            let notificationAttachment = try UNNotificationAttachment(identifier: UUID().uuidString, url: attachmentURL)
            notification.attachments = [notificationAttachment]
        }
        return notification
    }

    nonisolated init(title: String, subtitle: String? = nil, message: String, attachment: IntentFile? = nil, isTimeSensitive: Bool = false, threadID: String? = nil, notificationID: String? = nil, tapAction: TapAction = .nothing, tapActionShortcutName: String? = nil, tapActionShortcutInputParameter: String? = nil, tapActionURL: URL? = nil) {
        self.title = title
        self.subtitle = subtitle?.replacedWithNilIfEmpty
        self.message = message
        self.attachment = attachment
        self.isTimeSensitive = isTimeSensitive
        self.threadID = threadID?.replacedWithNilIfEmpty ?? UUID().uuidString
        self.notificationID = notificationID?.replacedWithNilIfEmpty ?? UUID().uuidString
        self.tapAction = tapAction
        self.tapActionShortcutName = tapActionShortcutName
        self.tapActionShortcutInputParameter = tapActionShortcutInputParameter
        self.tapActionURL = tapActionURL
    }

    func send() async throws {
        logV("Sending \(self)", category: .intent)
        let notificationContent = try constructUNNotificationContent()
        let request = UNNotificationRequest(identifier: notificationID, content: notificationContent, trigger: nil)
        try await UNUserNotificationCenter.current().add(request)
    }

    static func authorize() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .carPlay, .providesAppNotificationSettings]) { _, error in
            if let error { logE(error.localizedDescription, category: .service) }
        }
    }

}

extension LocalNotification: CustomStringConvertible {

    var description: String {
        "Notification: \(title)\(subtitle != nil ? " • \(subtitle!)" : "") • \(message)\(isTimeSensitive ? " • time sensitive" : "")\(attachment != nil ? " • Attachement: \(attachment!.filename)" : "") • Thread: \(threadID) • ID: \(notificationID) • Action: \(tapAction)\(tapActionShortcutName != nil ? " '\(tapActionShortcutName!)'" : "")\(tapActionShortcutInputParameter != nil ? " -> (\(tapActionShortcutInputParameter!))" : "")\(tapActionURL != nil ? "(\(tapActionURL!.absoluteString))" : "")"
    }

}

extension LocalNotification {

    enum TapAction: String, AppEnum, CustomStringConvertible {

        case nothing
        case runShortcut
        case openURL

        static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Tap Action")

        static var caseDisplayRepresentations: [Self: DisplayRepresentation] = [
            .nothing: DisplayRepresentation(title: "Do nothing", image: .init(systemName: "nosign")),
            .runShortcut: DisplayRepresentation(title: "Run Shortcut", image: .init(systemName: "wand.and.stars")),
            .openURL: DisplayRepresentation(title: "Open URL", image: .init(systemName: "link"))
        ]

        var description: String {
            switch self {
            case .nothing: return "Do nothing"
            case .runShortcut: return "Run Shortcut"
            case .openURL: return "Open URL"
            }
        }

        var categoryIdentifier: String {
            switch self {
            case .nothing: return ""
            case .runShortcut: return LocalNotification.Category.runShortcut.identifier
            case .openURL: return LocalNotification.Category.openURL.identifier
            }
        }

    }

    enum Category: CaseIterable {

        case runShortcut
        case openURL

        var identifier: String {
            buttonTitle
        }

        var registerable: UNNotificationCategory {
            UNNotificationCategory(identifier: identifier, actions: [action], intentIdentifiers: [])
        }

        private var action: UNNotificationAction {
            UNNotificationAction(identifier: identifier, title: buttonTitle, options: [])
        }

        private var buttonTitle: String {
            switch self {
            case .runShortcut: return "Run Shortcut"
            case .openURL: return "Open URL"
            }
        }

    }

}

// MARK: Notification Attachment

private extension LocalNotification {

    nonisolated func deleteAttachmentFromFileSystem() {
        guard let attachmentURL = attachment?.fileURL else { return }
        try? FileManager.default.removeItem(at: attachmentURL)
    }

    /// A dictionary of supported file types and the corresponding file size in Bytes.
    ///
    /// This is taken from Apple's documentation: https://developer.apple.com/documentation/usernotifications/unnotificationattachment/#Supported-File-Types
    private static var supportedAttachments: [UTType: Int] {
        [
            .jpeg: 10 * 1024 * 1024,
            .gif: 10 * 1024 * 1024,
            .png: 10 * 1024 * 1024,
            .aiff: 5 * 1024 * 1024,
            .wav: 5 * 1024 * 1024,
            .mp3: 5 * 1024 * 1024,
            .mpeg4Audio: 5 * 1024 * 1024,
            .mpeg: 50 * 1024 * 1024,
            .mpeg2Video: 50 * 1024 * 1024,
            .mpeg4Movie: 50 * 1024 * 1024,
            .avi: 50 * 1024 * 1024,
        ]
    }

    static func validateSupport(for attachmentType: UTType, filesize: Int) throws {
        guard supportedAttachments.keys.contains(where: { attachmentType.conforms(to: $0) }) else { throw ShowNotificationIntentError.notificationAttachmentTypeNotSupported(attachmentType) }
        guard supportedAttachments[attachmentType] ?? 0 >= filesize else { throw ShowNotificationIntentError.notificationAttachmentTooLarge }
    }

}

private extension IntentFile {

    func storeAsNotificationAttachment() throws -> URL? {
        guard let attachmentsFolderURL = try FileManager.default.getAttachmentsFolderURL() else { return nil }
        let fileURL = attachmentsFolderURL.appendingPathComponent(filenameWithExtension)
        try validateAsLocalNotificationAttachment()
        try data.write(to: fileURL)
        return fileURL
    }

    private var filenameWithExtension: String {
        guard let type, let filenameExtension = type.preferredFilenameExtension?.lowercased(), !filename.lowercased().hasSuffix(".\(filenameExtension)") else { return filename }
        return "\(filename).\(filenameExtension)"
    }

    private func validateAsLocalNotificationAttachment() throws {
        guard let type else { throw ShowNotificationIntentError.notificationAttachmentTypeNotSupported(nil) }
        return try LocalNotification.validateSupport(for: type, filesize: data.count)
    }

}

private extension FileManager {

    func getAttachmentsFolderURL() throws -> URL? {
        guard let attachmentsFolderURL = urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("NotificationAttachment") else { return nil }
        guard fileExists(atPath: attachmentsFolderURL.path) else { return try createAttachmentsFolder(at: attachmentsFolderURL) }
        return attachmentsFolderURL
    }

    private func createAttachmentsFolder(at attachmentsFolderURL: URL) throws -> URL? {
        try createDirectory(at: attachmentsFolderURL, withIntermediateDirectories: true, attributes: nil)
        return attachmentsFolderURL
    }

}
