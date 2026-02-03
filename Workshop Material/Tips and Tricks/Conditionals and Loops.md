# Conditionals and Loops

Like any programming environment, Shortcuts provides ways to make decisions and repeat actions. Here's what you need to know.

## The If Action

The **If** action evaluates one or more conditions and runs different actions based on the result. It creates three markers: **If**, **Otherwise**, and **End If**.

- Actions between **If** and **Otherwise** run when the condition is true
- Actions between **Otherwise** and **End If** run when the condition is false

**Tip:** If you don't need the false branch, you can simply delete the **Otherwise** marker. Your shortcut becomes cleaner when you only keep what you actually use. Note that when the condition doesn't apply, the input is passed through as output. If that's not what you need, have a look at the [Nothing Action](Nothing%20Action.md).

## Repeat

The **Repeat** action runs a group of actions a specified number of times. Place your actions between the **Repeat** and **End Repeat** markers.

By default, you enter a fixed number. But here's a feature many miss: **long-tap (touch and hold) the number** to replace it with a variable. This lets you repeat dynamically based on a count calculated earlier in your shortcut, or even use "Ask Each Time" to let the user decide at runtime.

Two special variables are available inside the loop:
- **Repeat Index** - The current iteration number (starts at 1)
- **Repeat Results** - Collects outputs from each iteration

## Repeat with Each

The **Repeat with Each** action iterates over a list of items. Instead of specifying a count, you provide a list - the loop runs once for each item.

Inside the loop, you get:
- **Repeat Item** - The current item being processed
- **Repeat Index** - The current iteration number
- **Repeat Results** - Collects outputs from each iteration

Use this when you have a collection of files, contacts, calendar events, or any list where you need to process each item individually.

## When to Use Which

- **Repeat** - When you know how many times to loop (or can calculate it)
- **Repeat with Each** - When you have a list and need to process every item

## Nested Loops

You can place loops inside loops. When you do, the inner loop's variables are renamed to **Repeat Item 1**, **Repeat Index 1**, etc. to distinguish them from the outer loop's variables.

---

[← Previous: Data Parameters](Data%20Parameters.md) | [Back to Overview](README.md) | [Next: Helper Shortcuts →](Helper%20Shortcuts.md)
