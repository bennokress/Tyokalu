//
// 📄 Työkalu.swift
// 👨🏼‍💻 Author: Benno Kress
//

import SwiftUI
import UIKit
import UserNotifications

@main
struct Työkalu: SwiftUI.App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            MainScreen()
        }
    }

}

class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.delegate = self
        notificationCenter.setNotificationCategories(Set(LocalNotification.Category.allCases.map(\.registerable)))
        return true
    }

}

extension AppDelegate: UNUserNotificationCenterDelegate {

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // This ensures that the notification is also shown if the app is active
        completionHandler(.banner)
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
        guard let urlString = response.notification.request.content.userInfo["URL"] as? String else { return logW("Notification Delegate", "Decoding URL String from Notification Payload failed", category: .general) }
        guard let url = URL(string: urlString) else { return logW("Notification Delegate", "Opening URL '\(urlString)' failed", category: .general) }
        logV("Notification Delegate", "Opening URL from notification: \(urlString)", category: .general)
        await UIApplication.shared.open(url)
    }

}
