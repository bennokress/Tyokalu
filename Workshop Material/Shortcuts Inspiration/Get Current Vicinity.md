# Get Current Vicinity

**Helper Shortcut** · Fast approximate location as a reusable building block

Many shortcuts need to know roughly where you are, but a full location request can be slow. There's a faster alternative hiding in an unexpected place: the Weather action.

## What It Does

A helper shortcut that fetches the current weather and extracts the location from it. Since Apple's weather service doesn't need pinpoint precision, this returns location data noticeably faster than a dedicated location request. The result is your general vicinity - accurate enough for most automation decisions, though not for exact navigation.

Other shortcuts call this helper via Run Shortcut whenever they need quick location context. You can use it interchangeably with an actual location action depending on what level of precision you need. Refer to the [Data Parameters](../Tips%20and%20Tricks/Data%20Parameters.md) tip for more on extracting hidden properties like location from action outputs.

## Why a Helper?

Determining your vicinity is useful in many contexts:

- **Focus Mode automation** → Which Focus Mode to activate (see [Focus Mode Automation](Focus%20Mode%20Automation.md))
- **Action Button** → Different behavior depending on where you are (see [Action Button Automation](Action%20Button%20Automation.md))

By extracting this into a helper, you define it once and reuse it everywhere. Refer to the [Helper Shortcuts](../Tips%20and%20Tricks/Helper%20Shortcuts.md) tip for more on this pattern.

---

[Back to Overview](README.md)
