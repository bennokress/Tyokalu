# CarPlay: Navigate to Next Event or Home

**Automation** · Start navigation automatically when you connect to CarPlay

You get in the car, CarPlay connects, and you either know where you're going or you're heading home. This automation checks your calendar and starts navigation for you - no tapping required.

## What It Does

When CarPlay connects, the automation looks at your upcoming calendar events. If the next event has a location attached, it starts navigation there. If there's nothing coming up (or no event has a location), it navigates home.

## Things to Consider

- The location field in calendar events needs to contain an actual address for Maps to understand it. "Meeting Room 3" won't work - but "Torikatu 18, Oulu" will.
- You might want to search from about 15 minutes ago up to the end of the day. If you're running late, you still want to navigate to that event - it's unlikely that something started in the last 15 minutes and you already have to go somewhere completely different.
- You can even specify a different navigation app than the built-in Apple Maps. For some you have to know the URL Scheme if they don't offer native Shortcuts actions, though.
- Bonus points if you add an input parameter to your shortcut that tells it whether the caller was Siri or the CarPlay Automation. Based on that, have Siri announce where you're going when you trigger it by voice - just so you can confirm it picked up the right event.

---

[Back to Overview](README.md)
