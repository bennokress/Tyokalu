//
// 📄 Main Screen.swift
// 👨🏼‍💻 Author: Benno Kress
//

import SwiftUI
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
            if notificationStatus != .authorized {
                permissionBox
            }
            testNotificationBox
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

    // MARK: - Permission Section

    private var permissionBox: some View {
        GroupBox {
            permissionBoxContent
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private var permissionBoxContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Notification Permission", systemImage: "bell.badge")
                .font(.headline)

            Text(permissionStatusText)
                .foregroundStyle(.secondary)

            permissionButton
                .buttonStyle(PrimaryButtonStyle())
                .accessibilityLabel("Grant notification permission")
                .accessibilityHint("Opens a system dialog to allow notifications from this app")
        }
    }

    /// Human-readable description of the current notification authorization status.
    private var permissionStatusText: String {
        switch notificationStatus {
        case .notDetermined:
            return String(localized: "This app needs permission to send notifications for Shortcuts actions.")
        case .denied:
            return String(localized: "Notification permission was denied. Please enable it in Settings to use notification actions.")
        case .provisional:
            return String(localized: "Notifications are provisionally allowed. Grant full permission for the best experience.")
        case .authorized:
            return String(localized: "Notifications are enabled.")
        case .ephemeral:
            return String(localized: "Notifications are temporarily allowed.")
        @unknown default:
            return String(localized: "Please grant notification permission to use all features.")
        }
    }

    private var permissionButton: some View {
        Button {
            LocalNotification.authorize()
        } label: {
            Text("Grant Permission")
        }
    }

    // MARK: - Test Notification Section

    private var testNotificationBox: some View {
        GroupBox {
            testNotificationBoxContent
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private var testNotificationBoxContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Test Notifications", systemImage: "paperplane")
                .font(.headline)

            notificationStatusDisplay

            testNotificationButton
                .buttonStyle(SecondaryButtonStyle())
                .disabled(notificationStatus != .authorized)
                .accessibilityLabel("Send test notification")
                .accessibilityHint(notificationStatus == .authorized ? "Sends a test notification to verify the setup" : "Grant notification permission first")
        }
    }

    private var notificationStatusDisplay: some View {
        HStack(spacing: 8) {
            Image(systemName: notificationStatus == .authorized ? "checkmark.circle.fill" : "xmark.circle.fill")
                .foregroundStyle(notificationStatus == .authorized ? .green : .red)
            Text(notificationStatus == .authorized ? "Ready to send notifications" : "Permission required")
                .foregroundStyle(.secondary)
        }
    }

    private var testNotificationButton: some View {
        Button {
            Task {
                let notification = LocalNotification(title: String(localized: "Test Notification"), message: String(localized: "Notifications are working correctly!"), isTimeSensitive: true, threadID: "Main Screen")
                try? await notification.send()
            }
        } label: {
            Text("Send Test Notification")
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

}

#Preview {
    MainScreen()
}
