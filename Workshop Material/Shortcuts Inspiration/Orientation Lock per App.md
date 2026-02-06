# Disable Orientation Lock for Specific Apps

**Automation** · Auto-rotate only where it makes sense

If you keep Orientation Lock on most of the time, some apps are just better in landscape - especially ones playing video that don't have a fullscreen rotation override implemented. Instead of toggling the lock manually every time, let an automation handle it.

## What It Does

Two automations that work as a pair: the first disables Orientation Lock when you open a specific app, the second re-enables it when you close that app. This way rotation is only available where you actually want it.

## Things to Consider

You can add multiple apps to a single trigger, so you don't need separate automations per app. If any of those apps opens, the lock turns off; when the last one closes, it turns back on.

---

[Back to Overview](README.md)
