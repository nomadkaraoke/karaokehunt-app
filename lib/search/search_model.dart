import '/components/empty_search_component_widget.dart';
import '/components/search_page_add_track_sheet_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SongSearchInput widget.
  TextEditingController? songSearchInputController;
  String? Function(BuildContext, String?)? songSearchInputControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    songSearchInputController?.dispose();
  }

  /// Additional helper methods are added here.

}
