# Automate Focus Mode Activation

**Complex Setup** · Activate the right Focus Mode based on your current circumstances

Setting Focus Modes based on basic triggers like time of day, location, or opening a specific app works just fine from the Focus Mode settings alone - no Shortcuts needed. But if you want a truly complex setup that considers dynamic data like your calendar, combines multiple triggers, or doesn't just deactivate a Focus Mode but immediately finds the next best one to activate, Shortcuts is the way to go.

## What It Does

A shortcut that evaluates your current circumstances - calendar events, active connections, workouts, and more - and decides which Focus Mode should be active right now. It goes beyond what the built-in Focus Mode triggers can do by combining multiple signals and always selecting the most appropriate mode rather than just toggling one on or off.

## Circumstances to Consider

Beyond the basic triggers available in Focus Mode settings, your phone can detect:

- **Wi-Fi network** → Which network are you connected to? This can distinguish between home, office, a café, or a friend's place.
- **Calendar events** → Do you have a meeting right now? Is today a workday, a vacation day, or a holiday? Calendar data is dynamic and much more flexible than fixed schedules.
- **CarPlay** → Are you connected to your car?
- **Workout** → Is a workout currently active on your Apple Watch?
- Anything else that can be detected and acted upon automatically - browse the available automation triggers for ideas.

The real power comes from combining these. For example, a time-of-day trigger for your evening wind-down Focus Mode shouldn't activate if you're in the middle of a workout. That's where a priority system helps.

## Automations

This is still restricted to the automations available on iOS, and while you could theoretically make another device your trigger, that device might not have all the parameters needed to decide the correct Focus Mode (like your current location or active workout). My recommendation is to leave both the triggers and the decision logic on your iPhone. You can always set and sync a Focus Mode manually from other devices.

## Priority

To prevent Focus Modes from overwriting each other, I've introduced a priority parameter into my personal "Focus Mode Selector" shortcut. This way I can be sure that activity-based Focus Modes don't get overwritten by events that would normally trigger a change. When a new trigger fires, the shortcut checks whether the currently active Focus Mode has a higher priority and only switches if it doesn't.

## My Focus Modes

This is a highly personal setup and different Focus Modes might fit you better, so take this only as one example of how it can work:

- **On the Road** → Activates/deactivates with CarPlay. High priority - cannot be disabled automatically.
- **Workout** → Activates/deactivates with any workout. Second highest priority - can only be overridden by connecting to CarPlay.
- **Augsburger Panther** → Activates/deactivates when I'm at the arena of my favorite hockey club. Third highest priority.
- **Sleeping** → Activates/deactivates manually with my "Going to Sleep" and "Waking Up" shortcuts that do much more than just set a Focus Mode (see [Night Time Preparation](Night%20Time%20Preparation.md)).
- **Evening** → Activates at 6 PM, or earlier if I trigger my "Feierabend" shortcut (a German word for "end of workday" with no real English equivalent). Normal priority - can be overwritten by anything above.
- **Christmas** → Activates with my "Waking Up" shortcut on days between Dec 24th and Jan 6th, as long as there's no event in my work calendar and no vacation in my vacation calendar. Normal priority.
- **Work** → Activates with my "Waking Up" shortcut on days with an event in my work calendar. Normal priority.
- **Vacation** → Activates with my "Waking Up" shortcut on days with a vacation event in my vacation calendar. Normal priority.
- **Leisure** → Activates with my "Waking Up" shortcut if Christmas, Work, and Vacation did not activate - mostly meaning it's a weekend or another day off. Normal priority.
- **Do Not Disturb** → Only activates and deactivates manually.

---

[Back to Overview](README.md)
