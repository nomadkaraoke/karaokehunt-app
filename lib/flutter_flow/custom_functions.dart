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
      if (item['Title']
              .toString()
              .toLowerCase()
              .contains(searchQuery.toLowerCase()) ||
          item['Artist']
              .toString()
              .toLowerCase()
              .contains(searchQuery.toLowerCase()) ||
          item['Brand']
              .toString()
              .toLowerCase()
              .contains(searchQuery.toLowerCase())) {
        filteredList.add(item);
      }
    }
  }

  filteredList.sort((a, b) => a['Artist'].compareTo(b['Artist']));

  return filteredList;
}
