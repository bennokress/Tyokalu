//
// 📄 App.swift
// 👨🏼‍💻 Author: Benno Kress
//

import Foundation

class App {

    static let shared = App()
    private init() { }

    var isDevelopmentBuild: Bool {
        CommandLine.arguments.contains("-development")
    }

    // MARK: - App Bundle Infos
    let name = Bundle.main.displayName ?? "Unknown App Name"
    let version = Bundle.main.appVersion ?? "Unknown App Version"
    let buildNumber = Bundle.main.appBuild ?? "Unknown App Build"
    let bundleID = Bundle.main.bundleIdentifier ?? "Unknown Bundle Identifier"

}
