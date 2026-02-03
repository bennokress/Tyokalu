# Make Use of Magic Variables

If you're coming from traditional programming, you might instinctively reach for the "Set Variable" action to store values. In Shortcuts, there's a better way: **Magic Variables**.

## Every Action Output Is Already a Variable

Every action in your shortcut automatically makes its output available as a Magic Variable. You don't need to explicitly save it - just select it when you need it in any subsequent action.

For example, if you have a "Get Current Weather" action, its output is immediately available to any action that follows. No "Set Variable" required.

## The Blue Pills

Variables appear as blue pill-shaped tokens in your shortcuts. What makes Magic Variables special is that they also display the icon of the action that created them, giving you a visual hint about where the data came from.

## Naming Your Variables

Here's where many beginners miss a powerful feature: **you can rename Magic Variables by tapping on any blue pill where you use it**.

When you tap a variable token, a variable editor appears at the bottom of the screen. Rename the variable to something meaningful like "User's Name" or "Selected Photo" - and all instances of that variable throughout your shortcut update automatically.

Well-named variables make complex shortcuts dramatically easier to read and maintain. Instead of seeing "Text" everywhere, you'll see descriptive names that explain what data is actually flowing through your shortcut.

## When to Use Set Variable

Manual variables (using "Set Variable") still have their place, but only in specific situations:
- When a value needs to change during the shortcut's execution
- When you need to append or accumulate data into a variable

For everything else, Magic Variables are more concise and easier to follow.

## Finding a Variable's Source

Lost track of where a variable came from? Tap the variable token and use the **Reveal Action** button in the variable editor. Shortcuts will scroll to and highlight the action that originally produced that variable - invaluable in longer shortcuts.

---

[← Previous: Shortcuts Organization](Shortcuts%20Organization.md) | [Back to Overview](README.md) | [Next: Coming Soon →]
