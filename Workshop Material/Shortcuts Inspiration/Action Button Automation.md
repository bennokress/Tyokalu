# Automate the Action Button

**Complex Setup** · Make the Action Button do different things depending on context

The Action Button on iPhone 15 Pro and later can be assigned to a single shortcut or a folder of shortcuts. If you choose a single shortcut, you can make it present a highly dynamic menu of actions that adapts to your current context. Choosing a folder gives you only a fixed set of options - but you can circumvent that limitation by adding a "More Options …" shortcut as the 8th entry in the folder, which presents the same kind of dynamic menu as the single-shortcut approach.

## What It Does

A single "router" shortcut assigned to the Action Button that evaluates your current context and branches into different actions. For example:

| Circumstance | Action |
|---|---|
| At the gym / workout active | Start or pause a workout |
| In a meeting (calendar event) | Toggle Do Not Disturb |
| Connected to home Wi-Fi | Control smart home |
| iPhone in landscape orientation | Open a special camera app like [65×24](https://apps.apple.com/app/id6502598669) - a second option beside the Camera button |
| Driving (CarPlay connected) | Start [navigation to next event](CarPlay%20Navigation.md) |
| Active Focus Mode | Makes decisions easier, but requires setting up useful [Focus Modes](Focus%20Mode%20Automation.md) |

## Keeping It Maintainable

This shortcut can get long quickly. Keep it manageable by delegating each branch to a separate shortcut (e.g., "Action Button - Gym", "Action Button - Home") and keeping the router itself as a pure decision tree with no actual logic. A shared helper like [Get Current Vicinity](Get%20Current%20Vicinity.md) can provide the context data your router needs to make its decisions.

---

[Back to Overview](README.md)
