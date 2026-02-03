# Helper Shortcuts

Just like refactoring code when a function grows too large or when you find yourself duplicating logic, you can refactor shortcuts the same way. The solution: **helper shortcuts**.

## What Is a Helper Shortcut?

A helper shortcut is a small, focused shortcut that:
- Accepts input
- Performs a specific task
- Returns output

You call it from other shortcuts using the **Run Shortcut** action. The helper does its job and passes the result back to the calling shortcut.

## When to Create One

Consider extracting a helper shortcut when:
- A shortcut is getting too long to follow
- You're copying the same sequence of actions into multiple shortcuts
- You want to isolate a piece of logic for easier testing and debugging

## Benefits

Helper shortcuts make complex automations more manageable. When something breaks, you can run the helper on its own with test input to verify it works correctly - much easier than debugging a 50-action shortcut.

They also keep your shortcuts DRY (Don't Repeat Yourself). Change the logic once in the helper, and every shortcut that uses it gets the update.

## Personal Tip: The Hidden Danger

From experience, helper shortcuts are both a blessing and a curse. They make complex shortcuts manageable, but Shortcuts has no dependency tracking - there's no way to see which shortcuts call a particular helper.

This means changing a helper's output format or deleting it might break shortcuts you didn't even think of.

My solution is the color coding system from the [Shortcuts Organization](Shortcuts%20Organization.md) article: all my helper shortcuts are **grey** to signal "don't run this directly." When I need to introduce breaking changes or want to delete a helper, I temporarily color it **red** and scroll through my shortcuts looking for that red icon in Run Shortcut actions. Red icons jump out immediately - but only if you reserve red exclusively for this purpose.

---

[← Previous: Data Parameters](Data%20Parameters.md) | [Back to Overview](README.md) | [Next: Coming Soon →]
