import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditDogProfileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for dogName widget.
  TextEditingController? dogNameController;
  String? Function(BuildContext, String?)? dogNameControllerValidator;
  // State field(s) for dogBreed widget.
  TextEditingController? dogBreedController;
  String? Function(BuildContext, String?)? dogBreedControllerValidator;
  // State field(s) for dogAge widget.
  TextEditingController? dogAgeController;
  String? Function(BuildContext, String?)? dogAgeControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    dogNameController?.dispose();
    dogBreedController?.dispose();
    dogAgeController?.dispose();
  }

  /// Additional helper methods are added here.

}
