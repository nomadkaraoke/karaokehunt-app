import '/components/loading_song_database_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_search_component_model.dart';
export 'empty_search_component_model.dart';

class EmptySearchComponentWidget extends StatefulWidget {
  const EmptySearchComponentWidget({Key? key}) : super(key: key);

  @override
  _EmptySearchComponentWidgetState createState() =>
      _EmptySearchComponentWidgetState();
}

class _EmptySearchComponentWidgetState
    extends State<EmptySearchComponentWidget> {
  late EmptySearchComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptySearchComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
          child: FaIcon(
            FontAwesomeIcons.sadTear,
            color: Color(0xFFFFDF6B),
            size: 90.0,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Text(
                  'No results found for this search',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).title3.override(
                        fontFamily: FlutterFlowTheme.of(context).title3Family,
                        color: FlutterFlowTheme.of(context).primaryText,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).title3Family),
                      ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Text(
                    'Sorry, but our song database doesn\'t contain anything which matches your search yet.\n\nIf you\'d like to request a karaoke track to be made by someone in our community, click below to go to the Karaoke Nerds song request form.\n\nIf you leave a tip, you\'re supporting the community, and your song is more likely to be created promptly! 💸❤️',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText2,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
          child: FFButtonWidget(
            onPressed: () async {
              logFirebaseEvent('EMPTY_SEARCH_COMPONENT_REQUEST_SONG_BTN_');
              logFirebaseEvent('Button_launch_u_r_l');
              await launchURL('https://karaokenerds.com/Request/New');
            },
            text: 'Request Song',
            options: FFButtonOptions(
              width: 170.0,
              height: 50.0,
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primaryColor,
              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                    fontFamily: 'Lexend Deca',
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).subtitle2Family),
                  ),
              elevation: 2.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Text(
                    'If you haven\'t used the app in a while, or you know one of your requests has recently been filled, update the database with the most recent list of community created songs!',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText2,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
          child: FFButtonWidget(
            onPressed: () async {
              logFirebaseEvent('EMPTY_SEARCH_COMPONENT_UPDATE_SONG_DATAB');
              logFirebaseEvent('Button_bottom_sheet');
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                isDismissible: false,
                enableDrag: false,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Container(
                      height: 300.0,
                      child: LoadingSongDatabaseWidget(),
                    ),
                  );
                },
              ).then((value) => setState(() {}));

              logFirebaseEvent('Button_update_app_state');
              setState(() {
                FFAppState().addToSongsdb(functions.placeholderSongDB()!.first);
              });
              logFirebaseEvent('Button_wait__delay');
              await Future.delayed(const Duration(milliseconds: 1000));
              logFirebaseEvent('Button_custom_action');
              await actions.fetchKaraokeSongDBGzip();
              logFirebaseEvent('Button_wait__delay');
              await Future.delayed(const Duration(milliseconds: 1000));
              logFirebaseEvent('Button_bottom_sheet');
              Navigator.pop(context);
              logFirebaseEvent('Button_navigate_to');

              context.pushNamed('Search');
            },
            text: 'Update Song Database',
            options: FFButtonOptions(
              width: 220.0,
              height: 50.0,
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: Color(0xFF207C70),
              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                    fontFamily: 'Lexend Deca',
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).subtitle2Family),
                  ),
              elevation: 2.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
