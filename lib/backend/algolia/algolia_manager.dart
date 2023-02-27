import 'dart:async';

import 'package:algolia/algolia.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../backend.dart';

export 'package:algolia/algolia.dart';

const kAlgoliaApplicationId = '3LYXBVXSAC';
const kAlgoliaApiKey = '971a2996e25209608fa0b768090c0b8e';

class AlgoliaQueryParams extends Equatable {
  const AlgoliaQueryParams(
      this.term, this.latLng, this.maxResults, this.searchRadiusMeters);
  final String? term;
  final LatLng? latLng;
  final int? maxResults;
  final double? searchRadiusMeters;

  @override
  List<Object?> get props => [term, latLng, maxResults, searchRadiusMeters];
}

class FFAlgoliaManager {
  FFAlgoliaManager._()
      : algolia = Algolia.init(
          applicationId: kAlgoliaApplicationId,
          apiKey: kAlgoliaApiKey,
          extraUserAgents: ['FlutterFlow_3.1.0'],
        );
  final Algolia algolia;

  static FFAlgoliaManager? _instance;
  static FFAlgoliaManager get instance => _instance ??= FFAlgoliaManager._();

  // Cache that will ensure identical queries are not repeatedly made.
  static Map<AlgoliaQueryParams, List<AlgoliaObjectSnapshot>> _algoliaCache =
      {};

  Future<List<AlgoliaObjectSnapshot>> algoliaQuery({
    required String index,
    String? term,
    int? maxResults,
    FutureOr<LatLng>? location,
    double? searchRadiusMeters,
  }) async {
    // User must specify search term or location.
    if ((term ?? '').isEmpty && location == null) {
      return [];
    }
    LatLng? loc;
    if (location != null) {
      loc = await location;
      // Either the user denied permissions, we could not access
      // their location, or null location specified.
      if (loc == null) {
        return [];
      }
    }
    final params =
        AlgoliaQueryParams(term, loc, maxResults, searchRadiusMeters);
    if (_algoliaCache.containsKey(params)) {
      return _algoliaCache[params]!;
    }

    AlgoliaQuery query = algolia.index(index);
    if (term != null) {
      query = query.query(term);
    }
    if (maxResults != null) {
      query = query.setHitsPerPage(maxResults);
    }
    if (loc != null) {
      query = query.setAroundLatLng('${loc.latitude},${loc.longitude}');
      query = query.setAroundRadius(searchRadiusMeters?.round() ?? 'all');
    }

    AlgoliaQuerySnapshot? snapshot;
    snapshot = await query
        .getObjects()
        .then((value) => snapshot = value)
        .catchError((error, stackTrace) {
      print('Algolia error: $error\nStack trace: $stackTrace');
    });
    return _algoliaCache[params] = snapshot?.hits ?? [];
  }
}
