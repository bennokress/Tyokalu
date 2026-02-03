# Using Comments

Beyond documenting expected input as described in [Using Dictionaries as Input](Dictionary%20Input.md), comments are valuable throughout your shortcuts. The Comment action does nothing logically - it simply passes any input through unchanged - but it serves as documentation for yourself and others.

## Two Special Use Cases

### 1. Documenting Imported Shortcuts

When you import a shortcut from someone else, add a comment at the top noting:
- Where you found it
- Who created it
- What the original name was (if you renamed it)

This information is invaluable when your modifications break something and you need to find the original version again.

### 2. Documenting Workarounds

Shortcuts has been known to have [one bug](https://appleinsider.com/articles/19/03/05/how-to-stop-apples-shortcuts-app-from-crashing-and-how-to-fix-what-caused-it) or [another](https://discussions.apple.com/thread/254598909) from [time](https://discussions.apple.com/thread/255168288) to [time](https://talk.automators.fm/t/shortcuts-crashes-when-adding-dictionaries-to-get-contents-of-url-is-this-just-me/15514). When you implement a workaround for buggy behavior, add a comment explaining why the logic exists. Without it, you (or someone else) might later "clean up" the workaround, not realizing it was there for a reason - and reintroduce the problem.

---

[← Previous: Dictionary Input](Dictionary%20Input.md) | [Back to Overview](README.md) | [Next: Coming Soon →]
