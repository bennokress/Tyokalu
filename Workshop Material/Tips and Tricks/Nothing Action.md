# The Nothing Action: Optionals for Shortcuts

In Swift, we use Optionals to represent values that might or might not exist. Shortcuts doesn't have Optionals built in, but you can achieve the same pattern using the **Nothing** action.

## The Pattern

Think of how you'd write this in Swift:

```swift
let nowPlaying: Song? = musicIsPlaying ? currentSong : nil
```

In Shortcuts, you replicate this with an **If** action:

1. Check your condition in the **If** action
2. In the **true** branch, add the logic that produces your value
3. In the **Otherwise** branch, use the **Nothing** action

The Magic Variable representing the If action's output now behaves like a Swift Optional - it either contains your value or nothing at all.

## Example: Optional Now Playing Context

Imagine a shortcut that logs your current activity to a journal. You want to include what song is playing, but only if music is actually on.

**The setup:**
1. Use **Get Current Song** to check what's playing
2. **If** "Current Song" **has any value**:
   - The true branch outputs the song name
   - The **Otherwise** branch uses **Nothing**
3. Name this Magic Variable something like "Now Playing"

**Later in the shortcut:**
- **If** "Now Playing" **has any value**:
   - Include "Listening to [Now Playing]" in your journal entry
- **Otherwise**:
   - Just log the activity without music context

The journal entry gets created either way - but with richer context when music is playing.

## Why This Matters

This pattern keeps your shortcuts flexible. Instead of aborting when optional data isn't available, you continue with graceful degradation - just like you would with `if let` unwrapping in Swift.

---

[← Previous: Comments](Comments.md) | [Back to Overview](README.md) | [Next: Wait Actions →](Wait%20Actions.md)
