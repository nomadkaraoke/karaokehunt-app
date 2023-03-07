// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:filesize/filesize.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:archive/archive.dart';

Future fetchKaraokeSongDBGzip() async {
  var logger = Logger(
    printer: PrettyPrinter(),
  );

  logger.d("fetchKaraokeSongDBGzip beginning");

  final storage = FirebaseStorage.instance;
  final gsReference = storage.refFromURL(
      'gs://projectbread-karaokay.appspot.com/karaokenerds-data/community/community-data-latest.json.gz');

  logger.d("gsReference acquired to file in firebase storage");

  var items = [];
  var uncompressedBytes;

  if (kIsWeb) {
    logger.d(
        "Platform is web, skipping cache to local filesystem and downloading directly into memory");

    final bytes = await gsReference.getData();
    uncompressedBytes = GZipDecoder().decodeBytes(bytes as List<int>);
  } else if (Platform.isAndroid || Platform.isIOS) {
    logger.d(
        "Platform is not web, downloading cache to local filesystem before loading into memory");

    // Download the gzipped file to a temporary file
    final directory = await getTemporaryDirectory();
    final tempFile = File('${directory.path}/community-data-latest.json.gz');

    logger.d("tempFile created: " + tempFile.path);
    await gsReference.writeToFile(tempFile);

    logger.d("database file written to tempFile");

    // Unzip the file and write the JSON data to the application storage
    final outputDirectory = await getApplicationDocumentsDirectory();
    final outputFile =
        File('${outputDirectory.path}/community-data-latest.json');

    logger.d("outputFile created: " + outputFile.path);

    final bytes = await tempFile.readAsBytes();
    uncompressedBytes = gzip.decode(bytes);
    await outputFile.writeAsBytes(uncompressedBytes);

    // logger.d the length of the list
    logger.d(
        "Successfully cached community DB to outputFile: " + outputFile.path);
    logger.d("Output filesize: " + filesize(outputFile.lengthSync()));

    // Delete the temporary file
    await tempFile.delete();
  } else {
    logger.e(
        "Unknown platform (not web, android or ios), unable to fetch song DB! Platform OS: " +
            Platform.operatingSystem);
  }

  final jsonStr = utf8.decode(uncompressedBytes);
  final jsonData = jsonDecode(jsonStr);

  // Extract the 'Items' key and write it to the app state
  items = jsonData['Items'];

  FFAppState().songsdb = items;

  logger.d(
      "Successfully written community data to songsdb, new songsdb size: " +
          items.length.toString());
}
