import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _playlist = prefs.getStringList('ff_playlist')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _playlist;
    });
    _safeInit(() {
      _songsdb = prefs.getStringList('ff_songsdb')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _songsdb;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<dynamic> _playlist = [];
  List<dynamic> get playlist => _playlist;
  set playlist(List<dynamic> value) {
    _playlist = value;
    prefs.setStringList(
        'ff_playlist', value.map((x) => jsonEncode(x)).toList());
  }

  void addToPlaylist(dynamic value) {
    playlist.add(value);
    prefs.setStringList(
        'ff_playlist', _playlist.map((x) => jsonEncode(x)).toList());
  }

  void removeFromPlaylist(dynamic value) {
    playlist.remove(value);
    prefs.setStringList(
        'ff_playlist', _playlist.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromPlaylist(int index) {
    playlist.removeAt(index);
    prefs.setStringList(
        'ff_playlist', _playlist.map((x) => jsonEncode(x)).toList());
  }

  void updatePlaylistAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    playlist[index] = updateFn(_playlist[index]);
    prefs.setStringList(
        'ff_playlist', _playlist.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInPlaylist(int index, dynamic value) {
    playlist.insert(index, value);
    prefs.setStringList(
        'ff_playlist', _playlist.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _songsdb = [];
  List<dynamic> get songsdb => _songsdb;
  set songsdb(List<dynamic> value) {
    _songsdb = value;
    prefs.setStringList('ff_songsdb', value.map((x) => jsonEncode(x)).toList());
  }

  void addToSongsdb(dynamic value) {
    songsdb.add(value);
    prefs.setStringList(
        'ff_songsdb', _songsdb.map((x) => jsonEncode(x)).toList());
  }

  void removeFromSongsdb(dynamic value) {
    songsdb.remove(value);
    prefs.setStringList(
        'ff_songsdb', _songsdb.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromSongsdb(int index) {
    songsdb.removeAt(index);
    prefs.setStringList(
        'ff_songsdb', _songsdb.map((x) => jsonEncode(x)).toList());
  }

  void updateSongsdbAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    songsdb[index] = updateFn(_songsdb[index]);
    prefs.setStringList(
        'ff_songsdb', _songsdb.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInSongsdb(int index, dynamic value) {
    songsdb.insert(index, value);
    prefs.setStringList(
        'ff_songsdb', _songsdb.map((x) => jsonEncode(x)).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
