# KaraokeHunt: Song Search & Playlist Builder

Have a great experience singing karaoke, by building the ideal playlist of songs for you and their friends!

Built in collaboration with Karaoke Nerds (https://karaokenerds.com) and the diveBar Karaoke Community (https://discord.gg/diveBar). Come join us! 🎤

<a href='https://play.google.com/store/apps/details?id=com.karaokehunt.karaokehunt&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1'><img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png' width='200px'/></a>

<img src='https://raw.githubusercontent.com/karaokenerds/karaokehunt-app/main/screenshots/Screenshot_20230227-202427.png' width='200px'/> <img src='https://raw.githubusercontent.com/karaokenerds/karaokehunt-app/main/screenshots/Screenshot_20230227-202059.png' width='200px'/> <img src='https://raw.githubusercontent.com/karaokenerds/karaokehunt-app/main/screenshots/Screenshot_20230227-202303.png' width='200px'/> 

### Feature Summary

V1:
- User Profiles
- Fetch Global Karaoke Song Catalog (from all known karaoke providers, including diveBar community)
- Fetch Song Analysis Data (e.g. genre, mood, key, danceability)
- Fetch Personal Listening History (e.g. from Spotify, Apple Music, YouTube, Last.fm)
- Filterable, Sortable Song List
- Personal Playlist Creation
- Post-Song Survey (e.g. did you enjoy singing this? did you need to be warmed up? did others like it?)

V2:
- Friend Filter (show only songs your friends know too)
- Group Playlists (playlist for whole group with each person singing in order)
- Auto-generated Playlist Recommendations
- Karaoke Bar Filter (show only songs which are actually available at location X)
- Transmit Playlist to System (integration with karaoke business partners' systems)

Full App Spec:
- https://docs.google.com/document/d/19LS1aJI8YwSmkWmDdpCHpmTGiHL9l0VDJ1SxSl4l6Z8/edit#

### Setup

As this project has Firestore integration, you must first run the following commands to ensure the project compiles:

```
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
```

This command creates the generated files that parse each Record from Firestore into a schema object.

### Getting started:

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
