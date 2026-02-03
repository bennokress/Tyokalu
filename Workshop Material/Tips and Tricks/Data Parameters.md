# Exploring Data Parameters

Some actions return more data than meets the eye. What looks like a simple output often contains a rich custom type with many extractable properties hidden beneath the surface.

## The Hidden Depth of Custom Types

Take the **Get Current Weather** action as an example. At first glance, it returns "Weather Conditions" - a summary of the current weather. But tap on that variable and look at the Type dropdown - behind that single output, you can extract 21 specific data points:

![Weather Conditions properties](https://raw.githubusercontent.com/bennokress/Tyokalu/main/Assets/weather-conditions-properties.png)

## How to Discover Hidden Properties

Whenever you work with an action's output, tap the variable and explore the Type dropdown. Many built-in and third-party actions provide custom types with properties you might not expect.

This is especially common with:
- Weather actions
- Calendar and Reminder actions
- Contact actions
- Location actions
- Health actions
- Media actions (photos, music)

## Personal Tip: Quick Location via Weather

One of the properties in Weather Conditions is **Location**. Since weather doesn't need pinpoint precision, Apple's weather service returns location data faster than a dedicated location request.

If you just need the general vicinity - not exact coordinates - the quickest way to get your current location is to fetch the current weather and extract the location from it. I have this as a helper shortcut and use it interchangeably with an actual location action depending on what level of precision I need.

---

[← Previous: Data Types](Data%20Types.md) | [Back to Overview](README.md) | [Next: Conditionals and Loops →](Conditionals%20and%20Loops.md)
