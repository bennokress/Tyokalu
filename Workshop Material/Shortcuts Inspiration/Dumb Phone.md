# Dumb Phone

**Automation** · Make your iPhone less addictive with Shortcuts

More and more people are looking for ways to reduce their screen time without giving up their smartphone entirely. The idea of a "dumb phone" - a phone that handles the essentials (calls, messages, maps, camera) but doesn't constantly pull you into apps and feeds - has become a real movement. You can go surprisingly far with just iOS settings, but Shortcuts can take it further by making the restrictions dynamic and context-aware.

## Settings

Many of the configurations have nothing to do with Shortcuts, so here's a quick overview:

- **Screen Time app limits** on social media and entertainment apps, ideally with a passcode held by someone you trust
- **Disable Safari** via Screen Time > Allowed Apps (or use a website allowlist under Web Content)
- **Disable the App Store** via Screen Time > iTunes & App Store Purchases
- **Reduce White Point** (~80%) under Accessibility > Display & Text Size - makes grayscale look better
- **Reduce animations** and disable auto-play for videos, previews, and message effects

## Shortcut: Grayscale per App

A colorless screen makes apps far less appealing and significantly reduces mindless scrolling. Setting your iPhone to grayscale via Accessibility > Color Filters is one of the most effective dumb phone tricks. But you probably still want color in the Camera, Photos, and a few other apps.

Same open/close automation pattern as [Orientation Lock per App](Orientation%20Lock%20per%20App.md) and [Unmute per App](Unmute%20per%20App.md): keep your phone in grayscale by default, but automatically disable it when you open apps where color actually matters. When you close those apps, grayscale comes back on. The underlying Color Filters accessibility setting needs to be enabled once in Settings before the automation can toggle it.

This concept was recently covered in a [blog post by iDownloadBlog](https://www.idownloadblog.com/2026/02/03/use-grayscale-smartly-on-iphone/) if you want a more detailed walkthrough.

## Shortcut: App Deactivation

Screen Time can disable apps on a fixed schedule, but if you want to block apps dynamically - based on the active Focus Mode, the time of day, or any other condition - Shortcuts gives you more control. It's not a perfect solution, but neither is Screen Time.

The idea: create an "App Opened" automation that covers all apps you want to limit. Set it to run immediately and have it check a condition - the current Focus Mode, a global variable, or whatever makes sense for your setup. If the check fails, the shortcut closes the app right away and optionally sends a local notification explaining why.

One caveat: every time you install a new app you want to limit, you need to add it to the automation's trigger list manually.

## Making App Deactivation More Flexible

If you want to give yourself a way out, configure the notification with an attached URL that runs a shortcut, passing the blocked app as a parameter. Tapping it could add the app to a temporary allow list so the next launch passes the check and the app stays open. After that one launch, the app is immediately removed from the allow list again. This way you can still use any app when you truly need it - but the friction of being blocked, dismissing a notification, and deliberately tapping through is usually enough to make you reconsider.

## Shortcut: Adding Friction

For apps you don't want to block entirely but still want to discourage, you can create shortcut icons that replace the real app icons on your Home Screen. When tapped, they show a confirmation dialog asking something like "Do you really want to open Instagram right now?" Only if you confirm does the shortcut actually open the app. That small moment of friction is often enough to break the autopilot habit of tapping an app icon without thinking.

## But What If I Need My iPhone for Work?

As Swift developers, chances are high we need our phones in a normal state for work - testing apps, checking logs, or just using tools that wouldn't survive a strict dumb phone setup. That's where you might need to dial back the restrictions and make your phone less dumb than it could be.

Personally, I only have no icons on my Home Screen other than the four apps I deliberately put in the Dock. All of them use the dark transparent icon style to make them less visually appealing, reducing the pull of apps that are designed to make you tap when you shouldn't (looking at you, Snapchat). But that's it for me so far.

I am, however, looking at adding a configurable switch that hides all app icons except for a curated selection displayed as a large widget by an app like [Dumb Phone](https://apps.apple.com/app/id6504743503). The switch would allow more (or all) apps to appear based on the active [Focus Mode](Focus%20Mode%20Automation.md), so the phone can be as dumb or as capable as the situation requires.

---

[Back to Overview](README.md)
