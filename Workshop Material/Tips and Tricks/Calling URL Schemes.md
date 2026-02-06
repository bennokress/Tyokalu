# Calling URL Schemes

This technique goes back to the roots of iOS automation. Before Apple acquired Workflow and turned it into Shortcuts, URL schemes were the backbone of the entire automation ecosystem. Apps like Launch Center Pro, Drafts, and the original Workflow app built powerful workflows by chaining URL scheme calls together.

Today, many apps offer native Shortcuts actions - but not all. When an app doesn't provide actions, there's a good chance it still supports URL schemes.

## Finding URL Schemes

Many URL schemes are documented by developers or can be found in community-maintained lists online. A quick search for "[App Name] URL Scheme iOS" often turns up what you need.

For apps without documented schemes, you'll need to do some digging. The schemes are buried in the app's Info.plist file, and with some technical effort, they can sometimes be uncovered.

## Personal Example: TomTom Navigation

My favorite navigation app is TomTom GO. It doesn't offer any Shortcuts actions, and at the time I needed it, the URL scheme wasn't documented anywhere.

With a little spelunking, I discovered:

```
tomtomgo://x-callback-url/navigate?destination={latitude},{longitude}
```

This starts navigation to the specified coordinates immediately - no extra taps required.

I use this in a shortcut that:
1. Looks up my next calendar event with a location
2. Gets the coordinates for that location
3. Launches TomTom GO and starts navigation

The URL scheme has since been [documented by the community](https://discussions.tomtom.com/en/discussion/998502/url-scheme-for-new-tomtom-go-mobile-for-ios-app), but TomTom still doesn't officially publish it. Many apps are like this - the schemes exist and work, you just have to find them.

## Settings URL Schemes

iOS has a special URL scheme for opening specific pages in the Settings app. In Shortcuts, use `prefs:root=` to jump to system settings or `App-prefs:` followed by an app's bundle ID to open that app's settings page directly.

Some useful examples:

| Destination | URL |
|---|---|
| Wi-Fi | `prefs:root=WIFI` |
| Bluetooth | `prefs:root=Bluetooth` |
| Battery | `prefs:root=BATTERY_USAGE` |
| Display & Brightness | `prefs:root=DISPLAY` |
| Notifications | `prefs:root=NOTIFICATIONS_ID` |
| Accessibility | `prefs:root=ACCESSIBILITY` |
| Camera | `prefs:root=CAMERA` |
| Any app's settings | `App-prefs:com.example.bundleid` |

You can go even deeper with `&path=` - for instance, `prefs:root=BATTERY_USAGE&path=BATTERY_HEALTH` opens the Battery Health page directly.

Be aware that these URLs are not officially documented by Apple and can break between iOS versions. Community-maintained lists like [ios-settings-urls on GitHub](https://github.com/FifiTheBulldog/ios-settings-urls) are the best reference for what currently works.

---

[← Previous: URL Scheme](URL%20Scheme.md) | [Back to Overview](README.md) | [Next: Data Types →](Data%20Types.md)
