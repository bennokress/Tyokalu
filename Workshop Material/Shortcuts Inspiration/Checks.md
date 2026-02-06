# Checks

**Helper Shortcut** · Reusable yes-or-no questions about your current state

Many of the more complex shortcuts and automations in this collection need to answer the same basic questions: Am I at home? Is today a workday? Are the lights still on? Instead of duplicating that logic everywhere, you can build small helper shortcuts that each answer exactly one question and return a simple Boolean.

## Examples

- **Am I at Home?** / **Am I at Work?** - Check the current Wi-Fi network name against a known SSID
- **Is Today a Workday?** / **Is Today a Vacation Day?** - Look for specific calendar events (e.g., a "Vacation" all-day event) to determine what kind of day it is. As a side note, the Työkalu starter project already includes similar functionality as standalone Shortcuts actions - checking whether today is a weekday, a specific day of the week, and more.
- **Is any Living Room Device on?** / **Are Lights turned off?** - Query your smart home to check the state of specific devices or rooms

They all follow the same pattern: check one thing, return true or false. Any shortcut that needs that answer can call the helper and branch on the result.

## Where This Shines

The [Night Time Preparation](Night%20Time%20Preparation.md) shortcut is a great example. Before starting a podcast on the bedroom HomePods, you might want to check if they're already in use - maybe your partner started listening before you got to bed. A small "Are Bedroom HomePods Playing?" check keeps the logic clean and avoids interrupting what's already running.

---

[Back to Overview](README.md)
