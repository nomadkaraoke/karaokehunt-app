import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/delete_post_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'post_details_model.dart';
export 'post_details_model.dart';

class PostDetailsWidget extends StatefulWidget {
  const PostDetailsWidget({
    Key? key,
    this.postReference,
    this.userRecord,
  }) : super(key: key);

  final DocumentReference? postReference;
  final UsersRecord? userRecord;

  @override
  _PostDetailsWidgetState createState() => _PostDetailsWidgetState();
}

class _PostDetailsWidgetState extends State<PostDetailsWidget> {
  late PostDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostDetailsModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserPostsRecord>(
      stream: UserPostsRecord.getDocument(widget.postReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final postDetailsUserPostsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: CachedNetworkImage(
                                  imageUrl: valueOrDefault<String>(
                                    postDetailsUserPostsRecord.postPhoto,
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sample-app-social-app-tx2kqp/assets/ot903vcfouv7/oscar-sutton-yihlaRCCvd4-unsplash.jpg',
                                  ),
                                  width: 100,
                                  height: 430,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Color(0x3F000000),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      buttonSize: 46,
                                      icon: Icon(
                                        Icons.arrow_back_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        size: 24,
                                      ),
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ),
                                  if (postDetailsUserPostsRecord.postOwner ??
                                      true)
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 44,
                                      fillColor: Color(0x41000000),
                                      icon: Icon(
                                        Icons.more_vert_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiaryColor,
                                        size: 24,
                                      ),
                                      onPressed: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.of(context)
                                                  .viewInsets,
                                              child: Container(
                                                height: 250,
                                                child: DeletePostWidget(
                                                  postParameters:
                                                      postDetailsUserPostsRecord,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Color(0xFF4B39EF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      1, 1, 1, 1),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      widget.userRecord!.photoUrl!,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Text(
                                        widget.userRecord!.userName!,
                                        style: FlutterFlowTheme.of(context)
                                            .subtitle1,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Text(
                                        dateTimeFormat(
                                            'relative',
                                            postDetailsUserPostsRecord
                                                .timePosted!),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  postDetailsUserPostsRecord.postDescription!
                                      .maybeHandleOverflow(
                                    maxChars: 200,
                                    replacement: '…',
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 6),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 16, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ToggleIcon(
                                          onPressed: () async {
                                            final likesElement =
                                                currentUserReference;
                                            final likesUpdate =
                                                postDetailsUserPostsRecord
                                                        .likes!
                                                        .toList()
                                                        .contains(likesElement)
                                                    ? FieldValue.arrayRemove(
                                                        [likesElement])
                                                    : FieldValue.arrayUnion(
                                                        [likesElement]);
                                            final userPostsUpdateData = {
                                              'likes': likesUpdate,
                                            };
                                            await postDetailsUserPostsRecord
                                                .reference
                                                .update(userPostsUpdateData);
                                          },
                                          value: postDetailsUserPostsRecord
                                              .likes!
                                              .toList()
                                              .contains(currentUserReference),
                                          onIcon: Icon(
                                            Icons.pets_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 25,
                                          ),
                                          offIcon: Icon(
                                            Icons.pets_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 25,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  4, 0, 0, 0),
                                          child: Text(
                                            functions
                                                .likes(
                                                    postDetailsUserPostsRecord)
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Icon(
                                        Icons.mode_comment_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 0, 0, 0),
                                        child: Text(
                                          postDetailsUserPostsRecord
                                              .numComments!
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.ios_share,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 16, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Comments',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Urbanist',
                                            fontSize: 12,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              StreamBuilder<List<PostCommentsRecord>>(
                                stream: queryPostCommentsRecord(
                                  queryBuilder: (postCommentsRecord) =>
                                      postCommentsRecord
                                          .where('post',
                                              isEqualTo:
                                                  postDetailsUserPostsRecord
                                                      .reference)
                                          .orderBy('timePosted',
                                              descending: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: CircularProgressIndicator(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  List<PostCommentsRecord>
                                      commentListPostCommentsRecordList =
                                      snapshot.data!;
                                  if (commentListPostCommentsRecordList
                                      .isEmpty) {
                                    return Center(
                                      child: Image.asset(
                                        'assets/images/commentsEmpty@2x.png',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height: 270,
                                      ),
                                    );
                                  }
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        commentListPostCommentsRecordList
                                            .length, (commentListIndex) {
                                      final commentListPostCommentsRecord =
                                          commentListPostCommentsRecordList[
                                              commentListIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 2),
                                        child: StreamBuilder<UsersRecord>(
                                          stream: UsersRecord.getDocument(
                                              commentListPostCommentsRecord
                                                  .user!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                  ),
                                                ),
                                              );
                                            }
                                            final commentUsersRecord =
                                                snapshot.data!;
                                            return Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    offset: Offset(0, 1),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 12, 8, 12),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 40,
                                                      height: 40,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          commentUsersRecord
                                                              .photoUrl,
                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sample-app-social-app-tx2kqp/assets/pbp73skqv1ru/shayna-douglas-lgILhKUELg4-unsplash.jpg',
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12, 0,
                                                                    0, 0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                commentUsersRecord
                                                                    .displayName,
                                                                'My Name Here',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .subtitle1,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                commentListPostCommentsRecord
                                                                    .comment!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            4,
                                                                            0),
                                                                    child: Text(
                                                                      'Posted',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    dateTimeFormat(
                                                                        'relative',
                                                                        commentListPostCommentsRecord
                                                                            .timePosted!),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    }),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: Color(0x3A000000),
                                offset: Offset(0, 1),
                              )
                            ],
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 4, 0, 4),
                                  child: TextFormField(
                                    controller: _model.textController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Comment here...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    final postCommentsCreateData =
                                        createPostCommentsRecordData(
                                      timePosted: getCurrentTimestamp,
                                      comment: _model.textController.text,
                                      user: currentUserReference,
                                      post:
                                          postDetailsUserPostsRecord.reference,
                                    );
                                    await PostCommentsRecord.collection
                                        .doc()
                                        .set(postCommentsCreateData);

                                    final userPostsUpdateData = {
                                      'numComments': FieldValue.increment(1),
                                    };
                                    await postDetailsUserPostsRecord.reference
                                        .update(userPostsUpdateData);
                                  },
                                  text: 'Post',
                                  options: FFButtonOptions(
                                    width: 70,
                                    height: 40,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Urbanist',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                    elevation: 0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
