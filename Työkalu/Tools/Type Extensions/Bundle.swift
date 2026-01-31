//
// 📄 Bundle.swift
// 👨🏼‍💻 Author: Benno Kress
//

import Foundation

extension Bundle {

    var displayName: String? {
        object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }

    var appVersion: String? {
        object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }

    var appBuild: String? {
        object(forInfoDictionaryKey: "CFBundleVersion") as? String
    }

}
