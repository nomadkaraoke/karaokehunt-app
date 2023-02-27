// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:archive/archive_io.dart';

Future fetchKaraokeSongDBGzip() async {
  final httpSongJSONUrl = Uri.https('static.karaokehunt.com',
      '/karaokenerds.com-community-data-2023-02-14.json.gz');

  final httpSongResponse = await http.get(httpSongJSONUrl);
  if (httpSongResponse.statusCode != 200) {
    print('Failed to retrieve the updated song database!');
    return;
  }

  print('httpSongResponse.bodyBytes = ' +
      httpSongResponse.bodyBytes.length.toString());

  final songsJSON =
      utf8.decode(GZipDecoder().decodeBytes(httpSongResponse.bodyBytes));

  print('songsJSON size = ' + songsJSON.length.toString());

  final songsObject = json.decode(songsJSON) as Map<String, dynamic>;

  FFAppState().songsdb = songsObject['Items'];
}
