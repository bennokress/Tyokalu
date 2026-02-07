# Save Currently Playing Song to Playlists

**Quick Action** · Save what's playing to one or more playlists

You hear a song you love and want to save it. Instead of opening your music app, finding the song, and adding it to a playlist manually, a single tap does it all.

## What It Does

A shortcut that grabs the currently playing song and adds it to one or more playlists in your streaming service. Trigger it from a widget, the Action Button, or Siri.

## Bonus: Songs from Other Sources

What if the song isn't playing from your own library - maybe it's from a different app, or from speakers in a café? Shortcuts has a built-in Shazam action that can identify songs from ambient audio. You could combine both approaches: first check if something is playing natively, and if not, fall back to Shazam. That way one shortcut covers both "save what I'm streaming" and "what's that song?" scenarios.

## Cross-Service

This works most naturally with Apple Music, which has full Shortcuts support. If you use Spotify or another service instead of Apple Music, you'll find that most streaming services unfortunately still do not offer native Shortcuts actions - in Spotify's case this has been a [long-standing community request](https://community.spotify.com/t5/Live-Ideas/iOS-Siri-Shortcuts-Support/idi-p/4569462) that remains unaddressed. You can work around this via API calls in Shortcuts, though that often involves OAuth authentication and adds significant complexity. This is also an excellent opportunity to write your own App Intents in the Työkalu starter project, wrapping those API calls in a clean Shortcuts action.

---

[Back to Overview](README.md)
