# Configuring Shortcut Input

When you create a shortcut, you can configure what types of input it accepts. This affects where your shortcut appears and what data it receives.

## Why Configure Input Types?

By default, shortcuts accept anything - but this clutters your Share Sheet. Every shortcut appears everywhere, even when it doesn't make sense.

**Tip:** Specify input types for each shortcut so your Share Sheet stays organized. A shortcut that only accepts URLs will appear in Safari but not in Photos. A shortcut that only accepts images will appear in Photos but not in Notes.

## Setting Up Input Types

In your shortcut's settings (tap the name at the top, then Details):

1. Enable **Show in Share Sheet** if you want it available there
2. Select which **Input Types** the shortcut accepts (Images, URLs, Text, Files, etc.)
3. Optionally enable **Receive What's On Screen** for Siri and Back Tap triggers

When you enable input, a **Receive** action appears at the beginning of your shortcut - this is where the shared content enters your workflow.

## Handling "No Input" Scenarios

What happens when someone runs your shortcut directly from the Shortcuts app, without any input? You need a fallback.

Use an **If** action to check if "Shortcut Input" **has any value**:
- If yes, use the provided input
- If no, prompt the user (Ask for Input, Select Photos, etc.) or use a sensible default

This makes your shortcut flexible - it works from the Share Sheet with input, and also works standalone with a prompt.

## Combining with Dictionary Input

For helper shortcuts that receive structured data from other shortcuts (see [Dictionary Input](Dictionary%20Input.md)), you typically accept **Text** as input and parse it as a dictionary. The calling shortcut passes a dictionary; your helper receives it as the Shortcut Input.

## Debugging Tip

To see exactly what an app passes to shortcuts, create a test shortcut that accepts **Anything** and contains only a **View Content Graph** action. Run it from different apps to discover what content types they share.

---

[← Previous: Dictionary Input](Dictionary%20Input.md) | [Back to Overview](README.md) | [Next: Comments →](Comments.md)
