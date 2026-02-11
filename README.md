# Työkalu

> [!TIP]
> **Did You Know?** "Työkalu" is the Finnish word for "tool". This app is your toolbox for Shortcuts, providing reusable actions that Apple doesn't include out of the box.

This repository accompanies my Shortcuts workshop "Unleashing Shortcuts" held at **[ARCtic Conference 2026](https://arcticonference.com)** in Oulu, Finland. The workshop walks through three levels of Shortcuts proficiency hands-on — from simple helpers and automations to multi-app workflows using APIs — and covers the path towards two more advanced levels involving Focus Modes, a context-aware Action Button, and building your own utility app. Työkalu serves as the starter project for that final level.

## Workshop Material

The **[Workshop Material](Workshop%20Material/)** folder contains supplementary resources for the workshop, including shortcut ideas for every level, curated links, and a collection of tips and tricks for Shortcuts creators.

## Build & Run

Open `Työkalu.xcodeproj` in Xcode, update the development team and bundle identifier to your own, then build with ⌘B. [SwiftFormat](https://github.com/nicklockwood/SwiftFormat) runs automatically as a build phase before compilation to enforce a consistent code style — remove the build phase if you prefer your own formatting. The project uses **[PrettyLog](https://github.com/bennokress/PrettyLog)** for structured and readable console output.
