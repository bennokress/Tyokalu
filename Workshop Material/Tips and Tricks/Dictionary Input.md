# Using Dictionaries as Input

When building complex shortcuts, you often need to pass multiple parameters to a [helper shortcut](Helper%20Shortcuts.md). While you could pass a list and rely on position (first item = name, second item = date, etc.), this approach is fragile and hard to maintain.

A better solution: **pass a dictionary**.

## Why Dictionaries?

Dictionaries (JSON objects) give you named parameters instead of positional ones. Instead of hoping the third item in your list is the email address, you explicitly ask for the value with key "email".

Benefits:
- **Self-documenting** - Keys describe what each value represents
- **Order-independent** - Parameters can be in any order
- **Extensible** - Add new parameters without breaking existing callers

That last point is crucial: when you add a new optional parameter to your helper shortcut, shortcuts that don't use it continue to work unchanged.

## Creating a Dictionary

In the calling shortcut, use the **Dictionary** action to build your parameters. Add key-value pairs for each parameter you want to pass, then feed the dictionary into the **Run Shortcut** action.

The helper shortcut receives this dictionary as its input and can extract values using **Get Dictionary Value** with the appropriate key.

## Handling Optional Parameters

To make parameters optional, check if they exist before using them. Use the **If** action with the condition **"has any value"** on the result of Get Dictionary Value. If the key wasn't provided, the value will be empty and your shortcut can use a default or skip that functionality.

This pattern lets you extend helper shortcuts over time without breaking every shortcut that calls them.

## Personal Bonus Tip: Document Your Input

Make it a habit to add a **Comment** action at the top of helper shortcuts that accept dictionary input. Document the expected JSON structure - which keys are mandatory, which are optional, and what values they expect.

Then follow it with **If** checks for all mandatory parameters using "has any value". If a required parameter is missing, show an **Alert** with a clear error message, then use **Stop Shortcut** without any output. Your future self (and anyone else using the helper) will thank you.

**Side note:** If you find yourself maintaining a growing collection of helper shortcuts and you're confident the same logic could be written in Swift, that's a perfect candidate for an App Intent in your own utility app. The helper shortcut becomes a native action - faster, more reliable, and one less shortcut to maintain. If setting up an Xcode project feels like too much overhead for this benefit, check out the [Työkalu starter project](../../README.md) in this repository. The setup work is already done and you can start implementing your first App Intent immediately.

---

[← Previous: Helper Shortcuts](Helper%20Shortcuts.md) | [Back to Overview](README.md) | [Next: Shortcut Input →](Shortcut%20Input.md)
