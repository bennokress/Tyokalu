# Wait and Wait to Return

Sometimes your shortcut needs to pause. Shortcuts provides two different wait actions for different situations.

## Wait

The **Wait** action pauses execution for a specified number of seconds before continuing. Use this when you need a fixed delay - for example, waiting for the phone to regain network connection and checking it again after a few moments.

Like many actions with numeric parameters, you can long-tap the seconds value to use a variable instead of a fixed number.

## Wait to Return

The **Wait to Return** action pauses your shortcut until you leave the Shortcuts app and come back to it. This is useful when your shortcut opens another app and you need to do something manually before continuing.

**Example workflow:**
1. Open a document in another app
2. **Wait to Return** (shortcut pauses)
3. You make edits, copy something to the clipboard
4. Switch back to Shortcuts (shortcut resumes)
5. **Get Clipboard** to grab what you copied
6. Continue processing

## When to Use Which

| Situation | Action |
|-----------|--------|
| Fixed delay (5 seconds for something to load) | Wait |
| User needs to do something in another app | Wait to Return |
| Timing is predictable | Wait |
| Timing depends on user action | Wait to Return |

## Limitations

- **Wait to Return** stays active for about 4 minutes. If you take longer, the shortcut may timeout.
- Split View can cause issues with **Wait to Return** - the action may not detect the app switch correctly. Using Slide Over instead tends to work better.

---

[← Previous: Nothing Action](Nothing%20Action.md) | [Back to Overview](README.md) | [Next: Advanced Menus →](Advanced%20Menus.md)
