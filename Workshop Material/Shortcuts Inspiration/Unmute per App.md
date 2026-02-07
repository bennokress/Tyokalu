# Disable Mute for Specific Apps

**Automation** · Force sound on for apps that respect the mute switch a little too well

Some apps tie their audio output to the mute switch even when you don't want them to. An app plays a video or audio, you turn the volume all the way up, and there's still no sound - because your phone is on silent. This automation fixes that per app.

## What It Does

Same open/close pattern as [Orientation Lock per App](Orientation%20Lock%20per%20App.md): when you open a specific app, the automation unmutes the device. When you close it, it mutes again. Your phone stays on silent everywhere else.

## Which Apps?

For me the only offender is my Norwegian learning app Mjølnir, but there are plenty of apps out there that behave this way. If any app on your phone stays silent when you actually want to hear it, it's a candidate. Since you can select multiple apps in a single trigger, one automation pair covers all of them.

---

[Back to Overview](README.md)
