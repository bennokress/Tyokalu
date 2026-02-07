# Debug URL Schemes

**Complex Setup** · Use Shortcuts to trigger debug states in your own apps

If you're building apps, you've likely needed to put your app into a specific state for testing - a particular screen, a logged-in user, a feature flag combination. Instead of navigating there manually every time, you can register custom URL schemes in your app that set up exactly the constellation you need, then trigger them from a shortcut.

## Why Shortcuts?

The real power isn't just the URL scheme itself - it's that Shortcuts turns it into something shareable. You can build a shortcut with a menu of your debug states and share it with colleagues and testers. Everyone on the team gets the same quick access to the same test configurations, without needing to know the URL schemes by heart.

## Taking It Further

- Add an update mechanism: hardcode a version number in the shortcut and keep a running list of versions with share links on a server. When the version on the server is higher than the local one, the shortcut asks the user to update - tapping through opens the share link, which triggers the installation that just has to be confirmed.
- Use [Advanced Menus](../Tips%20and%20Tricks/Advanced%20Menus.md) with icons and subtitles to make the debug menu visually clear, especially when you have many options.

---

[Back to Overview](README.md)
