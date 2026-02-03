# Understanding Data Types

Every value in Shortcuts has a type - Text, Number, Date, Dictionary, and so on. Understanding how types work and how to convert between them is essential for building reliable shortcuts.

## Type Coercion via the Variable Editor

Here's a feature many beginners miss: **you can convert compatible data types simply by tapping on a variable**.

When you tap any blue variable pill at its usage site, a variable editor appears at the bottom of the screen. Among other options, you'll find a **type dropdown** that lets you change how Shortcuts interprets that variable.

For example, if you have a Number and need it as Text, tap the variable, change the type to Text, and Shortcuts handles the conversion automatically.

## Common Conversions That Work

Some type conversions happen seamlessly:

- **Number ↔ Text** - Numbers become their string representation and vice versa
- **Date ↔ Text** - Dates can be formatted as text (with format options available)
- **URL ↔ Text** - URLs become their string form
- **Boolean ↔ Number** - True becomes 1, False becomes 0

## When Conversions Fail

Not all types are convertible. Attempting an incompatible conversion may result in empty output or unexpected behavior. Always **test your shortcuts** after changing a variable's type to ensure the conversion works as expected.

Some conversions that won't work:
- Random text → Number (unless the text actually contains a valid number)
- Complex objects → simple types without extracting specific properties first

## The Get Type Action

If you're debugging and need to know what type a variable actually is, use the **Get Type** action. It returns the type name as text, which is invaluable when a shortcut isn't behaving as expected.

## For Developers: Building Robust App Intents

If you're building your own app with App Intents (like the Työkalu starter project), keep type coercion in mind from the developer's perspective.

Users may pass unexpected types to your intent parameters. A parameter expecting a number might receive text, or a date might arrive in an unexpected format. **Validate your inputs** and provide clear, actionable error messages when something goes wrong.

A good error message tells the user:
- What went wrong ("Expected a number, but received text")
- How to fix it ("Make sure the input contains only digits")

Vague errors like "Invalid input" leave users frustrated and guessing. The few extra lines of validation code pay off in user experience.

---

[← Previous: Calling URL Schemes](Calling%20URL%20Schemes.md) | [Back to Overview](README.md) | [Next: Data Parameters →](Data%20Parameters.md)
