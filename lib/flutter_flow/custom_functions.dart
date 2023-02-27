import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

List<dynamic> fetchKaraokeSongs(String? searchQuery) {
  dynamic unfilteredSongList = [
    {
      "artist": "ABBA",
      "brand": "Rewind Karaoke",
      "created_at": {"__time__": "2022-08-31T06:00:00.000Z"},
      "title": "The Visitors",
      "youtube_link": "https://youtu.be/ii5PrLxtTg4"
    },
    {
      "artist": "ABBA",
      "brand": "Wrathaoke",
      "created_at": {"__time__": "2022-08-17T06:00:00.000Z"},
      "title": "Gimme! Gimme! Gimme! (A Man After Midnight)",
      "youtube_link": "https://youtu.be/I9WKjm8OJho"
    },
    {
      "artist": "ABBA",
      "brand": "Sandell Karaoke",
      "created_at": {"__time__": "2022-11-26T07:00:00.000Z"},
      "title": "Mamma Mia [metal]",
      "youtube_link": "https://youtu.be/LVjbju35ajo"
    },
    {
      "artist": "U2",
      "brand": "RVZN Karaoke",
      "title": "New Year's Day",
      "youtube_link": "https://youtu.be/NmIUCRaTQoQ",
    },
    {
      "artist": "Five Finger Death Punch",
      "brand": "Obscure Karaoke",
      "title": "Salvation",
      "youtube_link": "https://youtu.be/acRzKrcCD-U",
    },
    {
      "artist": "Purity Ring",
      "brand": "WIZZYOKE",
      "title": "Grammy (Soulja Boy)",
      "youtube_link": "https://youtu.be/0R5GQPzd5g8",
    },
    {
      "artist": "Trash Boat",
      "brand": "Core Karaoke",
      "title": "He's So Good",
      "youtube_link": "https://youtu.be/9_afq71xCBY",
    },
    {
      "artist": "Raimundos",
      "brand": "ObsKure Karaoke",
      "title": "I Saw You Saying (That You Say That You Saw)",
      "youtube_link": "https://youtu.be/UowKWs4VaTA",
    },
    {
      "artist": "One11Twenty",
      "brand": "ObsKure Karaoke",
      "title": "Last 10 Seconds",
      "youtube_link": "https://youtu.be/sUknHUM03Kk",
    },
    {
      "artist": "Ween",
      "brand": "Karaoke Nerds",
      "title": "Buenas Tardes Amigo",
      "youtube_link": "https://youtu.be/wBUB5x9c6E0",
    },
    {
      "artist": "Disturbed",
      "brand": "Sandell Karaoke",
      "title": "Hold On To Memories",
      "youtube_link": "https://youtu.be/grp2Dbtuzok",
    },
    {
      "artist": "Suicide Silence",
      "brand": "Cereal Killer Karaoke",
      "title": "Disengage",
      "youtube_link": "https://youtu.be/MKhmYVDVEX4",
    },
    {
      "artist": "The Breeders",
      "brand": "Karaoke From Space",
      "title": "No Aloha",
      "youtube_link": "https://youtu.be/10IwlxdLAxE",
    },
    {
      "artist": "Rehab",
      "brand": "ObsKure Karaoke",
      "title": "Red Water",
      "youtube_link": "https://youtu.be/qjbzgPO0ef8",
    },
    {
      "artist": "Animal Collective",
      "brand": "karaokear",
      "title": "For Reverend Green",
      "youtube_link": "https://youtu.be/mlfHFsvQsxE",
    },
    {
      "artist": "Bright Eyes",
      "brand": "Karaoke Nerds",
      "title": "Tourist Trap",
      "youtube_link": "https://youtu.be/zj68jFY7EHM",
    },
    {
      "artist": "Martha And The Muffins",
      "brand": "Lemmy Caution",
      "title": "Paint By Number Heart",
      "youtube_link": "https://youtu.be/q2jvz5VJ0tY",
    },
    {
      "artist": "Weezer",
      "brand": "CC Karaoke",
      "title": "I Need Some Of That",
      "youtube_link": "https://youtu.be/9xbx96E6tCI",
    },
    {
      "artist": "Tim Heidecker",
      "brand": "Funbox Karaoke",
      "title": "Our Values are Under Attack",
      "youtube_link": "https://youtu.be/06W8wevaCyM",
    },
    {
      "artist": "Foo Fighters",
      "brand": "Last Word Karaoke",
      "title": "Arrows",
      "youtube_link": "https://youtu.be/cQtZzUBCVZU",
    },
    {
      "artist": "Bryan Adams",
      "brand": "Obscure Karaoke",
      "title": "I Wanna Be Your Underwear",
      "youtube_link": "https://youtu.be/bXwZMPqqoSI",
    },
    {
      "artist": "Green Day",
      "brand": "CC Karaoke",
      "title": "Troubled Times",
      "youtube_link": "https://youtu.be/mWae7Bmw-0k",
    },
    {
      "artist": "U2 & Johnny Cash",
      "brand": "RVZN Karaoke",
      "title": "The Wanderer",
      "youtube_link": "https://youtu.be/Zu1skqWz1KQ",
    },
    {
      "artist": "A Perfect Circle",
      "brand": "Kadda OK",
      "title": "Gravity",
      "youtube_link": "https://youtu.be/sQAQLFcVeJg",
    },
    {
      "artist": "Faith No More",
      "brand": "Rewind Karaoke",
      "title": "Surprise! You're Dead!",
      "youtube_link": "https://youtu.be/1GknP6aRgc8",
    },
    {
      "artist": "Charly Bliss",
      "brand": "Peareoke",
      "title": "Percolator",
      "youtube_link": "https://youtu.be/K6MDCakJjTc",
    },
    {
      "artist": "Dashboard Confessional",
      "brand": "FakeyOke",
      "title": "The Places You Have Come To Fear The Most",
      "youtube_link": "https://youtu.be/w521p5MwQ5I",
    },
    {
      "artist": "Motion City Soundtrack",
      "brand": "FakeyOke",
      "title": "Make Out Kids",
      "youtube_link": "https://youtu.be/OPuEfWICHEw",
    },
    {
      "artist": "Killswitch Engage",
      "brand": "Wrathaoke",
      "title": "Rose Of Sharyn",
      "youtube_link": "https://youtu.be/xuUeWJ1Vd4I",
    },
    {
      "artist": "John Littleton",
      "brand": "lopenash",
      "title": "Minuit Chrétiens",
      "youtube_link": "https://youtu.be/DyVECnHA6Co",
    },
    {
      "artist": "Ramones",
      "brand": "Rock Solid Karaoke",
      "title": "Cretin Hop",
      "youtube_link": "https://youtu.be/8j_AB2-EIAI",
    },
    {
      "artist": "Moodring",
      "brand": "Core Karaoke",
      "title": "Now I'm Lost",
      "youtube_link": "https://youtu.be/6qrg_XZU4Sw",
    },
    {
      "artist": "Peeping Tom",
      "brand": "CloakyOke",
      "title": "Don't Even Trip (Feat. Amon Tobin)",
      "youtube_link": "https://youtu.be/9DDeXkgSUz8",
    },
    {
      "artist": "The Motels",
      "brand": "ObsKure Karaoke",
      "title": "Mission Of Mercy",
      "youtube_link": "https://youtu.be/Z8QlnODal0I",
    },
    {
      "artist": "Tony Vega",
      "brand": "ObsKure Karaoke",
      "title": "Mi Esposa",
      "youtube_link": "https://youtu.be/3sf1NiP9N1I",
    },
    {
      "artist": "Dream Theater",
      "brand": "CC Karaoke",
      "title": "Metropolis Pt 1",
      "youtube_link": "https://youtu.be/oekmpTmoHU4",
    },
    {
      "artist": "Lali Puna",
      "brand": "karaokear",
      "title": "Micronomic",
      "youtube_link": "https://youtu.be/KTspIN2tgSg",
    },
    {
      "artist": "shoes",
      "brand": "Zipper Karaoke",
      "title": "Tomorrow Night",
      "youtube_link": "https://youtu.be/wW9FheoPIG0",
    },
    {
      "artist": "Lamb of God",
      "brand": "CC Karaoke",
      "title": "The Undertow",
      "youtube_link": "https://youtu.be/J7sHB-6Gt18",
    },
    {
      "artist": "Sheer Mag",
      "brand": "Peareoke",
      "title": "Fan the Flames",
      "youtube_link": "https://youtu.be/ZdocLDxty20",
    },
    {
      "artist": "Andromeda",
      "brand": "CC Karaoke",
      "title": "My Star",
      "youtube_link": "https://youtu.be/3RDn5fs8MUY",
    },
    {
      "artist": "The Bronx",
      "brand": "CC Karaoke",
      "title": "Knifeman",
      "youtube_link": "https://youtu.be/_CMpxaB015Y",
    },
    {
      "artist": "Paramore",
      "brand": "CC Karaoke",
      "title": "All I Wanted",
      "youtube_link": "https://youtu.be/EimVjuodLt8",
    },
    {
      "artist": "Manic Street Preachers",
      "brand": "Scream Queen Karaoke",
      "title": "Theme From M*A*S*H (Suicide Is Painless)",
      "youtube_link": "https://youtu.be/wZ81QgxkKmI",
    },
    {
      "artist": "Tori Amos",
      "brand": "Caritas",
      "title": "Blood Roses",
      "youtube_link": "https://youtu.be/7mWrPNK4oTw",
    },
    {
      "artist": "The Protomen",
      "brand": "Karaoak Tree",
      "title": "No Easy Way Out",
      "youtube_link": "https://youtu.be/p_kS5i7L9r0",
    },
    {
      "artist": "Jallen Rix",
      "brand": "Zipper Karaoke",
      "title": "When You Touch Me I Know",
      "youtube_link": "https://youtu.be/ARWRpXSs1l4",
    },
    {
      "artist": "Admiral",
      "brand": "Empty Orchestra Karaoke",
      "title": "Meter And Rule",
      "youtube_link": "https://youtu.be/6AKSTMoW7L0",
    },
    {
      "artist": "Adrain 'Dee' Desaire",
      "brand": "Zipper Karaoke",
      "title": "Twila's Song",
      "youtube_link": "https://youtu.be/HWyp72FbCps",
    },
    {
      "artist": "Disturbed",
      "brand": "CC Karaoke",
      "title": "Stricken",
      "youtube_link": "https://youtu.be/7KuiPps4taY",
    },
    {
      "artist": "Cars",
      "brand": "CC Karaoke",
      "title": "Don't Cha Stop",
      "youtube_link": "https://youtu.be/d-zCd-WCF3s",
    },
    {
      "artist": "Mitsu-O! Feat. Geila",
      "brand": "Last Word Karaoke",
      "title": "My Summer Love",
      "youtube_link": "https://youtu.be/nqKcjZKc0Mk",
    },
    {
      "artist": "Valley Swerve",
      "brand": "RankAmateur FeelgoodMachine",
      "title": "Rero Rero Trapu",
      "youtube_link": "https://youtu.be/cHADAaprV1c",
    }
  ];

  List<Map<String, dynamic>> filteredList = [];

  searchQuery = searchQuery?.trim();

  if (searchQuery == null || searchQuery.trim().isEmpty) {
    filteredList = unfilteredSongList;
  } else {
    for (var item in unfilteredSongList) {
      if (item['title']
              .toString()
              .toLowerCase()
              .contains(searchQuery.toLowerCase()) ||
          item['artist']
              .toString()
              .toLowerCase()
              .contains(searchQuery.toLowerCase()) ||
          item['brand']
              .toString()
              .toLowerCase()
              .contains(searchQuery.toLowerCase())) {
        filteredList.add(item);
      }
    }
  }

  return filteredList;
}

List<dynamic> fetchKaraokeSongsFromState(
  List<dynamic> unfilteredSongList,
  String? searchQuery,
) {
  List<dynamic> filteredList = [];

  searchQuery = searchQuery?.trim();

  if (searchQuery == null || searchQuery.trim().isEmpty) {
    filteredList = unfilteredSongList;
  } else {
    for (var item in unfilteredSongList) {
      if (item['title']
              .toString()
              .toLowerCase()
              .contains(searchQuery.toLowerCase()) ||
          item['artist']
              .toString()
              .toLowerCase()
              .contains(searchQuery.toLowerCase()) ||
          item['brand']
              .toString()
              .toLowerCase()
              .contains(searchQuery.toLowerCase())) {
        filteredList.add(item);
      }
    }
  }

  return filteredList;
}
