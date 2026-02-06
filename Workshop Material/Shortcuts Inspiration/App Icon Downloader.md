# App Icon Downloader

**Quick Action** · Download an app's icon from the App Store

Sometimes you need an app icon for a presentation, a shortcut's Home Screen icon, or just out of curiosity. The App Store doesn't make it easy to grab the icon file directly, but the iTunes Search API does.

## What It Does

A shortcut that asks for an app name and the platform (iPhone, iPad, Mac), searches the App Store via the iTunes Search API, and saves the icon image. The API returns icon URLs in the JSON response, so you get a high-resolution PNG without any scraping.

## Taking It Further

Bonus points if you mask the downloaded image as an actual app icon - with the rounded corners and everything. That makes it more visually pleasing when used in a presentation.

---

[Back to Overview](README.md)
