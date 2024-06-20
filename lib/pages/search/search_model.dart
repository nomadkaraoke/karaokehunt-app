import '/flutter_flow/flutter_flow_util.dart';
import 'search_widget.dart' show SearchWidget;
import 'package:flutter/material.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for SongSearchInput widget.
  FocusNode? songSearchInputFocusNode;
  TextEditingController? songSearchInputTextController;
  String? Function(BuildContext, String?)?
      songSearchInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    songSearchInputFocusNode?.dispose();
    songSearchInputTextController?.dispose();
  }
}
