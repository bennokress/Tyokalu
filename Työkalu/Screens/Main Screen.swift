//
// 📄 Main Screen.swift
// 👨🏼‍💻 Author: Benno Kress
//

import SwiftUI
import UIKit
import UserNotifications

/// The main screen of the app displaying notification setup and testing UI.
///
/// This view serves as the primary interface for users to:
/// - Understand the app's purpose as a Shortcuts action provider
/// - Grant notification permissions required for notification intents
/// - Test that notifications are working correctly
///
/// The screen automatically monitors notification authorization status and updates its UI when the app returns to the foreground.
struct MainScreen: View {

    @Environment(\.scenePhase) private var scenePhase
    @State private var notificationStatus: UNAuthorizationStatus = .notDetermined

    var body: some View {
        navigationWrapper
            .task(checkNotificationStatus)
            .onChange(of: scenePhase, refreshNotificationStatusIfNecessary)
    }

    private var navigationWrapper: some View {
        NavigationStack {
            scrollWrapper
                .navigationTitle("🇫🇮 " + App.shared.name)
        }
    }

    private var scrollWrapper: some View {
        ScrollView {
            allBoxes
                .padding()
        }
    }

    private var allBoxes: some View {
        VStack(spacing: 24) {
            introductionBox
            notificationBox
            didYouKnowBox
        }
    }

    // MARK: - Introduction Section

    private var introductionBox: some View {
        GroupBox {
            introductionBoxContent
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private var introductionBoxContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("About This App", systemImage: "info.circle")
                .font(.headline)
            Text("This app provides actions for the Shortcuts app.")
                .foregroundStyle(.secondary)
            Text("Once notification permission is granted, there's no additional functionality here other than using the test button below to verify notifications work correctly.")
                .foregroundStyle(.secondary)
        }
    }

    // MARK: - Notification Section

    private var notificationBox: some View {
        GroupBox {
            notificationBoxContent
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    @ViewBuilder
    private var notificationBoxContent: some View {
        switch notificationStatus {
        case .authorized, .provisional, .ephemeral:
            testNotificationContent
        case .denied:
            permissionDeniedContent
        case .notDetermined:
            requestPermissionContent
        @unknown default:
            requestPermissionContent
        }
    }

    // MARK: Permission Request Content

    private var requestPermissionContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Notification Permission", systemImage: "bell.badge")
                .font(.headline)

            Text("This app needs permission to send notifications for Shortcuts actions.")
                .foregroundStyle(.secondary)

            Button {
                LocalNotification.authorize()
            } label: {
                Text("Grant Permission")
            }
            .buttonStyle(PrimaryButtonStyle())
            .accessibilityLabel("Grant notification permission")
            .accessibilityHint("Opens a system dialog to allow notifications from this app")
        }
    }

    // MARK: Permission Denied Content

    private var permissionDeniedContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Notification Permission", systemImage: "bell.badge")
                .font(.headline)

            Text("Notification permission was denied. To use notification actions in Shortcuts, you need to enable notifications in the Settings app.")
                .foregroundStyle(.secondary)

            Text("Tap the button below to open Settings, then enable \"Allow Notifications\" for this app.")
                .foregroundStyle(.secondary)

            Button {
                openAppSettings()
            } label: {
                Text("Open Settings")
            }
            .buttonStyle(PrimaryButtonStyle())
            .accessibilityLabel("Open app settings")
            .accessibilityHint("Opens the Settings app to enable notifications")
        }
    }

    // MARK: Test Notification Content

    private var testNotificationContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Test Notification Capability", systemImage: "bell.badge")
                .font(.headline)

            HStack(spacing: 8) {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.green)
                Text("Ready to send notifications")
                    .foregroundStyle(.secondary)
            }

            Button {
                Task {
                    let notification = LocalNotification(title: String(localized: "Test Notification"), message: String(localized: "Notifications are working correctly!"), isTimeSensitive: true, threadID: "Main Screen")
                    try? await notification.send()
                }
            } label: {
                Text("Send Test Notification")
            }
            .buttonStyle(SecondaryButtonStyle())
            .accessibilityLabel("Send test notification")
            .accessibilityHint("Sends a test notification to verify the setup")
        }
    }

    // MARK: - Did You Know Section

    private var didYouKnowBox: some View {
        GroupBox {
            didYouKnowBoxContent
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private var didYouKnowBoxContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Did You Know?", systemImage: "lightbulb")
                .font(.headline)
            Text("\"Työkalu\" is the Finnish word for \"tool\".")
                .foregroundStyle(.secondary)
            Text("This app is your toolbox for Shortcuts, providing reusable actions that Apple doesn't include out of the box.")
                .foregroundStyle(.secondary)
        }
    }

    // MARK: - Helper Methods

    /// Refreshes the notification status when the app becomes active.
    ///
    /// This ensures the UI reflects any permission changes made in Settings while the app was backgrounded.
    ///
    /// - Parameters:
    ///   - oldScenePhase: The previous scene phase.
    ///   - newScenePhase: The new scene phase to check.
    private func refreshNotificationStatusIfNecessary(oldScenePhase: ScenePhase, newScenePhase: ScenePhase) {
        guard newScenePhase == .active else { return }
        Task { await checkNotificationStatus() }
    }

    /// Fetches the current notification authorization status from the system.
    ///
    /// Updates ``notificationStatus`` on the main actor to trigger UI updates.
    private func checkNotificationStatus() async {
        let settings = await UNUserNotificationCenter.current().notificationSettings()
        await MainActor.run {
            notificationStatus = settings.authorizationStatus
        }
    }

    /// Opens the app's notification settings in the Settings app.
    private func openAppSettings() {
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
        UIApplication.shared.open(settingsURL)
    }

}

#Preview("🇨🇦 English") {
    MainScreen()
}

#Preview("🇩🇪 German") {
    MainScreen()
        .environment(\.locale, Locale(identifier: "de"))
}

#Preview("🇳🇴 Norwegian Bokmål") {
    MainScreen()
        .environment(\.locale, Locale(identifier: "nb"))
}
