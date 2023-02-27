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
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path/karaokenerds.com-community-data.json');
}

Future<File> writeJSON(jsonstring) async {
  final file = await _localFile;

  // Write the file
  return file.writeAsString('$jsonstring');
}

Future fetchKaraokeSongDB() async {
  final httpSongJSONUrl = Uri.https('static.karaokehunt.com',
      '/karaokenerds.com-community-data-2023-02-14-smallsample.json');

  final httpSongResponse = await http.get(httpSongJSONUrl);
  if (httpSongResponse.statusCode != 200) {
    print('Failed to retrieve the updated song database!');
    return;
  }

  writeJSON(httpSongResponse.body);

  final songsObject =
      json.decode(httpSongResponse.body) as Map<String, dynamic>;

  FFAppState().songsdb = songsObject['Items'];
}
