# Work Calendar Sync

**Complex Setup** · Mirror work events to your personal calendar

If your company's calendar isn't on your personal phone - or you want a simplified view of your work schedule alongside personal events - you can build a shortcut that syncs relevant work events to a personal calendar. This can also be useful if you want to share your work schedule with family but sharing the calendar directly isn't possible (or allowed). How complex this gets depends entirely on your setup and the restrictions put in place by your employer.

## What It Does

A shortcut (or automation) that reads your work calendar and creates corresponding events in a personal calendar, giving you a unified view without exposing sensitive details.

## Possible Approaches

This one varies wildly depending on your work environment:

- **Work calendar already on your phone** → The simplest case. The shortcut can read work events directly and create stripped-down copies (e.g., just the time block labeled "Work - Meeting" without attendees or notes) in your personal calendar.
- **Work calendar accessible via URL (ICS)** → Many calendar systems offer a private ICS URL. The shortcut can fetch and parse this text-based format to create personal calendar entries.
- **Calendar behind a corporate firewall** → The most complex scenario. You'd likely need an intermediary service (a cloud function, Make/Zapier, or Power Automate) to bridge the gap and expose the data via an API your shortcut can call.

## Things to Consider

- **Privacy**: Strip sensitive information (attendees, meeting links, detailed descriptions) when copying to your personal calendar. A simple "Busy" or "Meeting" label is often enough.
- **Duplicates**: You'll need a way to detect and skip events that have already been synced. A unique identifier in the event notes can help.
- **Frequency**: Running the sync too often wastes battery and API calls. A time-based automation (e.g., once in the morning and once after lunch) is usually sufficient.
- **Deletions and changes**: The simple version only adds events. Handling moved or cancelled events adds significant complexity - and is where a dedicated service might be more practical than Shortcuts alone.

---

[Back to Overview](README.md)
