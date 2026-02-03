# Shortcuts Organization

As your shortcut collection grows, finding the one you need becomes increasingly difficult. The Shortcuts app offers three main tools to keep things tidy: **folders**, **colors**, and **icons**. Used thoughtfully, these can turn a chaotic list into a well-organized toolkit.

## Folders

Folders are your primary organizational tool. Create them by tapping the folder icon in the main view and giving each a descriptive name.

**Common folder strategies:**
- **By topic** - Group shortcuts by what they relate to (Work, Home, Travel, Health)
- **By trigger** - Separate shortcuts by how you run them (Widgets, Share Sheet, Automations)
- **By frequency** - Keep your most-used shortcuts in a "Favorites" folder for quick access

A shortcut can only live in one folder, but it automatically appears in "All Shortcuts" regardless of where you put it. Folders sync across all your devices via iCloud, so you only need to organize once.

## Colors

Every shortcut has a background color that appears in the app, widgets, and the Share Sheet. While purely aesthetic at first glance, colors become powerful when used systematically.

Pick a color scheme that means something to you. Some ideas:
- Color-code by category (blue for productivity, green for health, orange for social)
- Reserve specific colors for specific purposes (see personal tip below)

## Icons

The Shortcuts app includes hundreds of SF Symbols (sadly not all of them) you can use as icons. A well-chosen icon helps you recognize a shortcut at a glance, especially in widgets where you might only see the icon and name.

**Tips for choosing icons:**
- Pick icons that represent the *result* of the shortcut, not just one action in it
- Use consistent icons for related shortcuts (e.g., all messaging shortcuts use speech bubble variants)
- For Home Screen shortcuts, you can also use custom images instead of SF Symbols

## Personal Tip: Using Colors Strategically

Here's a system that works well for managing complex shortcut libraries:

**Grey for helper shortcuts** - These are shortcuts that aren't useful on their own but provide reusable functionality when called from other shortcuts. The grey color signals "don't run this directly."

**Red reserved for dependency checking** - Shortcuts doesn't warn you when you delete a shortcut that's being called from another one. To avoid breaking things, reserve the color red exclusively for this purpose: before deleting a shortcut, temporarily change its color to red. Then scroll through your other shortcuts and look for Run Shortcut actions - they display the called shortcut's icon. A red icon will jump out immediately, making it easy to spot which shortcuts depend on the one you want to delete. This only works if you never use red for anything else.

---

[Back to Overview](README.md) | [Next: Magic Variables →](Magic%20Variables.md)
