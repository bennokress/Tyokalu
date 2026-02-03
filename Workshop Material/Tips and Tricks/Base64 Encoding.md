# Base64 Encoding

Base64 converts binary data (images, sounds, files) into text. This lets you embed files directly in your shortcut as plain text - no external dependencies required.

## Why Use Base64?

Shortcuts doesn't support file attachments as part of the scripting language. If you want a sound effect, image, or other file to be part of your shortcut itself (rather than stored externally), Base64 is the solution.

A Base64-encoded file is just text. You can store it in a **Text** action, and your shortcut becomes fully self-contained and portable.

## The Actions

Shortcuts provides two built-in actions:
- **Encode** - Converts files/data to Base64 text
- **Decode** - Converts Base64 text back to the original data

## Example: Conditional Sound Effects

Imagine a shortcut that plays different sounds based on previous logic - a success chime or an error buzz.

**Setup (one-time):**
1. Get your small MP3 files
2. Use the **Encode** action (set to Base64) on each one
3. Copy the resulting text
4. Store each encoded sound in a **Text** action in your shortcut

**In your shortcut:**
1. Use **If** to check your condition
2. In each branch, reference the appropriate Text action (containing the encoded sound)
3. Use **Decode** (from Base64) to convert back to audio data
4. Use **Play Sound** on the decoded result

The sounds are now embedded in your shortcut. Share it with anyone, and the sounds come along - no external files needed.

## Practical Considerations

- **File size matters** - Base64 increases size by about 33%. Keep embedded files small.
- **Short sounds work best** - A 2-second MP3 encodes to manageable text. A 5-minute song becomes unwieldy.
- **Images too** - The same technique works for embedding small images (icons, watermarks) in your shortcuts.

---

[← Previous: Debugging](Debugging.md) | [Back to Overview](README.md) | [Next: Working with APIs →](Working%20with%20APIs.md)
