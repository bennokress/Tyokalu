# Debugging Shortcuts

When a shortcut isn't working as expected, you need ways to inspect what's happening. Here are techniques from simple to advanced.

## Quick Look for Inspection

The **Quick Look** action displays whatever you pass to it - text, images, files, dictionaries. Insert it anywhere in your shortcut to see what a variable actually contains at that point.

## Stepping Through with Alert

For step-by-step debugging, use **Show Alert** with the **Show Cancel Button** option enabled. Pass the variable you want to inspect as the message.

When the alert appears:
- Tap **OK** to continue to the next step
- Tap **Cancel** to stop the shortcut immediately

This gives you manual control over execution, letting you step through and inspect values one at a time.

## Exiting Early

Use **Stop Shortcut** to exit at any point. This is useful when you want to test just the first part of a complex shortcut without running through everything else.

## Advanced: Logger

For serious debugging, [Logger](https://apps.apple.com/app/id1611554653) provides a real developer console for Shortcuts. You can write messages, tag them by category, and watch them appear in real-time as your shortcut runs. All logs sync via iCloud and persist for later review.

**Warning:** If you embed Logger actions in your shortcuts and later delete the app (or iOS offloads it to save space), those shortcuts will break - even though their actual logic still works fine. The shortcut can't find the Logger actions and fails to run until you reinstall the app. This is an issue with all third-party actions, but especially frustrating when the action that breaks your shortcut doesn't even matter to the actual execution.

If you use Logger, be mindful of this dependency. Consider removing Logger actions from "production" shortcuts once debugging is complete, or keep Logger installed permanently.

---

[← Previous: Wait Actions](Wait%20Actions.md) | [Back to Overview](README.md) | [Next: Advanced Menus →](Advanced%20Menus.md)
