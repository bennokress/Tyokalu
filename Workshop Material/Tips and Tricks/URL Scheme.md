# The shortcuts:// URL Scheme

Any service that can open a URL can run a shortcut. This opens up powerful integration possibilities with external services and apps that Shortcuts doesn't natively connect to.

## The URL Structure

```
shortcuts://run-shortcut?name=[name]&input=[input]&text=[text]
```

### Parameters

| Parameter | Required | Description |
|-----------|----------|-------------|
| `name` | Yes | The name of the shortcut to run. Must be URL-encoded. |
| `input` | No | Specifies the input type. Use `text` to pass a string, or `clipboard` to use clipboard contents. |
| `text` | No | The actual text to pass as input (when `input=text`). Must be URL-encoded. |

### x-callback-url Support

For apps that need to know when your shortcut finishes, use the x-callback-url variant:

```
shortcuts://x-callback-url/run-shortcut?name=[name]&input=[input]&text=[text]&x-success=[url]&x-cancel=[url]&x-error=[url]
```

| Parameter | Description |
|-----------|-------------|
| `x-success` | URL to open when the shortcut completes successfully. A `result` parameter with the shortcut's output is appended. |
| `x-cancel` | URL to open if the user cancels the shortcut. |
| `x-error` | URL to open if the shortcut fails. |

## Example 1: Push Notifications That Run Shortcuts

Services like [Pushover](https://pushover.net), [ntfy](https://ntfy.sh), or automation platforms like [Home Assistant](https://www.home-assistant.io) let you send push notifications with custom URLs as the tap action.

Set the URL to `shortcuts://run-shortcut?name=Your%20Shortcut` and tapping the notification runs your shortcut. Combine this with a server, webhook, or scheduled task, and you can trigger shortcuts from anywhere in the world.

## Example 2: Beautiful Lock Screen Widgets

Lock screen widgets in iOS are limited in what they can do - but they can open URLs. Most apps only let you open themselves, but [Marvis Pro](https://apps.apple.com/app/id1447768809) - primarily a music player - offers fully customizable lock screen widgets that can open any URL.

I use this to run shortcuts directly from my lock screen with custom icons:

![Marvis lock screen widgets](https://raw.githubusercontent.com/bennokress/Tyokalu/main/Assets/marvis-lockscreen-widgets.png)

"Dauerkarte" opens a shortcut that displays my season ticket for my favorite German hockey team, the Augsburger Panther. "PantherPay" opens the Wallet pass with my code for special pricing on food in the arena. Both are just `shortcuts://run-shortcut?name=...` URLs behind beautiful custom widgets.

## Personal Tip: Easier Notification Setup

The [Työkalu starter project](../../README.md) in this repository includes a custom local notification action with a "Run Shortcut" option. Instead of manually constructing and URL-encoding the `shortcuts://` URL yourself, you simply enter the shortcut name and optional input text - the app handles the encoding for you.

It's my favorite feature of the app and sets it apart from other utility apps on the App Store that offer their own notification actions.

---

[← Previous: Nothing Action](Nothing%20Action.md) | [Back to Overview](README.md) | [Next: Calling URL Schemes →](Calling%20URL%20Schemes.md)
