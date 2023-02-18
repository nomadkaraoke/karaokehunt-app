import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../create_dog_profile_new/create_dog_profile_new_widget.dart';
import '../edit_dog_profile/edit_dog_profile_widget.dart';
import '../edit_settings/edit_settings_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../post_details/post_details_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_page_model.dart';
export 'profile_page_model.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({Key? key}) : super(key: key);

  @override
  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  late ProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
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
        final profilePageUsersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      valueOrDefault<String>(
                                        profilePageUsersRecord.displayName,
                                        'UserName',
                                      ),
                                      textAlign: TextAlign.start,
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                        child: Text(
                                          profilePageUsersRecord.email!,
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFFEE8B60),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        child: Text(
                                          profilePageUsersRecord.bio!,
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.85, 0.68),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    borderRadius: BorderRadius.circular(90),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.85, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4, 4, 4, 4),
                                      child: Container(
                                        width: 90,
                                        height: 90,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.network(
                                          valueOrDefault<String>(
                                            profilePageUsersRecord.photoUrl,
                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sample-app-social-app-tx2kqp/assets/5lywt4ult0tj/flouffy-qEO5MpLyOks-unsplash.jpg',
                                          ),
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.bottomToTop,
                              duration: Duration(milliseconds: 250),
                              reverseDuration: Duration(milliseconds: 250),
                              child: CreateDogProfileNewWidget(),
                            ),
                          );
                        },
                        text: 'Add a Dog',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Urbanist',
                                color:
                                    FlutterFlowTheme.of(context).tertiaryColor,
                              ),
                          elevation: 2,
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.bottomToTop,
                              duration: Duration(milliseconds: 250),
                              reverseDuration: Duration(milliseconds: 250),
                              child: EditSettingsWidget(),
                            ),
                          );
                        },
                        text: 'Settings',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          textStyle: FlutterFlowTheme.of(context).bodyText1,
                          elevation: 0,
                          borderSide: BorderSide(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: FlutterFlowTheme.of(context).primaryColor,
                          unselectedLabelColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          labelStyle: FlutterFlowTheme.of(context).subtitle2,
                          indicatorColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          indicatorWeight: 2,
                          tabs: [
                            Tab(
                              text: 'Dog Profiles',
                            ),
                            Tab(
                              text: 'Posts',
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                child: StreamBuilder<List<DogsRecord>>(
                                  stream: queryDogsRecord(
                                    queryBuilder: (dogsRecord) =>
                                        dogsRecord.where('userAssociation',
                                            isEqualTo: currentUserReference),
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
                                    List<DogsRecord> listViewDogsRecordList =
                                        snapshot.data!;
                                    if (listViewDogsRecordList.isEmpty) {
                                      return Center(
                                        child: Image.asset(
                                          'assets/images/emptyDog@2x.png',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                        ),
                                      );
                                    }
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount: listViewDogsRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewDogsRecord =
                                            listViewDogsRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 12, 16, 0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 3,
                                                  color: Color(0x32000000),
                                                  offset: Offset(0, 1),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(8),
                                                    bottomRight:
                                                        Radius.circular(0),
                                                    topLeft: Radius.circular(8),
                                                    topRight:
                                                        Radius.circular(0),
                                                  ),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        valueOrDefault<String>(
                                                      listViewDogsRecord
                                                          .dogPhoto,
                                                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sample-app-social-app-tx2kqp/assets/gu4akoa3hju1/victor-grabarczyk-N04FIfHhv_k-unsplash.jpg',
                                                    ),
                                                    width: 100,
                                                    height: 100,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 0, 0, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          listViewDogsRecord
                                                              .dogName!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .title3,
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          4,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                listViewDogsRecord
                                                                    .dogType!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4,
                                                                          4,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                listViewDogsRecord
                                                                    .dogAge!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 12, 0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    borderRadius: 30,
                                                    borderWidth: 2,
                                                    buttonSize: 44,
                                                    icon: Icon(
                                                      Icons.edit_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .grayIcon,
                                                      size: 24,
                                                    ),
                                                    onPressed: () async {
                                                      await Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              EditDogProfileWidget(
                                                            dogProfile:
                                                                listViewDogsRecord,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                                child: StreamBuilder<List<UserPostsRecord>>(
                                  stream: queryUserPostsRecord(
                                    queryBuilder: (userPostsRecord) =>
                                        userPostsRecord
                                            .where('postUser',
                                                isEqualTo:
                                                    profilePageUsersRecord
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
                                    List<UserPostsRecord>
                                        socialFeedUserPostsRecordList =
                                        snapshot.data!;
                                    if (socialFeedUserPostsRecordList.isEmpty) {
                                      return Center(
                                        child: Image.asset(
                                          'assets/images/emptyPosts@2x.png',
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          height: 400,
                                        ),
                                      );
                                    }
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          socialFeedUserPostsRecordList.length,
                                      itemBuilder: (context, socialFeedIndex) {
                                        final socialFeedUserPostsRecord =
                                            socialFeedUserPostsRecordList[
                                                socialFeedIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 8),
                                          child: StreamBuilder<UsersRecord>(
                                            stream: UsersRecord.getDocument(
                                                socialFeedUserPostsRecord
                                                    .postUser!),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final userPostUsersRecord =
                                                  snapshot.data!;
                                              return Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4,
                                                      color: Color(0x32000000),
                                                      offset: Offset(0, 2),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                ),
                                                child: InkWell(
                                                  onTap: () async {
                                                    await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            PostDetailsWidget(
                                                          userRecord:
                                                              userPostUsersRecord,
                                                          postReference:
                                                              socialFeedUserPostsRecord
                                                                  .reference,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 8, 2, 4),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Card(
                                                                clipBehavior: Clip
                                                                    .antiAliasWithSaveLayer,
                                                                color: Color(
                                                                    0xFF4B39EF),
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          1,
                                                                          1,
                                                                          1,
                                                                          1),
                                                                  child:
                                                                      Container(
                                                                    width: 40,
                                                                    height: 40,
                                                                    clipBehavior:
                                                                        Clip.antiAlias,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        userPostUsersRecord
                                                                            .photoUrl,
                                                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sample-app-social-app-tx2kqp/assets/wn636nykq7im/lucrezia-carnelos-0liYTl4dJxk-unsplash.jpg',
                                                                      ),
                                                                      fit: BoxFit
                                                                          .fitWidth,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        userPostUsersRecord
                                                                            .userName,
                                                                        'myUsername',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1,
                                                                    ),
                                                                  ),
                                                                  FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        30,
                                                                    buttonSize:
                                                                        46,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_control,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size: 20,
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          'IconButton pressed ...');
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              valueOrDefault<
                                                                  String>(
                                                            socialFeedUserPostsRecord
                                                                .postPhoto,
                                                            'https://d.newsweek.com/en/full/1310267/best-hawaii-beaches.jpg',
                                                          ),
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          height: 300,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8, 4, 8, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          16,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      ToggleIcon(
                                                                        onPressed:
                                                                            () async {
                                                                          final likesElement =
                                                                              profilePageUsersRecord.reference;
                                                                          final likesUpdate = socialFeedUserPostsRecord.likes!.toList().contains(likesElement)
                                                                              ? FieldValue.arrayRemove([
                                                                                  likesElement
                                                                                ])
                                                                              : FieldValue.arrayUnion([
                                                                                  likesElement
                                                                                ]);
                                                                          final userPostsUpdateData =
                                                                              {
                                                                            'likes':
                                                                                likesUpdate,
                                                                          };
                                                                          await socialFeedUserPostsRecord
                                                                              .reference
                                                                              .update(userPostsUpdateData);
                                                                        },
                                                                        value: socialFeedUserPostsRecord
                                                                            .likes!
                                                                            .toList()
                                                                            .contains(profilePageUsersRecord.reference),
                                                                        onIcon:
                                                                            Icon(
                                                                          Icons
                                                                              .favorite_rounded,
                                                                          color:
                                                                              Color(0xFF4B39EF),
                                                                          size:
                                                                              25,
                                                                        ),
                                                                        offIcon:
                                                                            Icon(
                                                                          Icons
                                                                              .favorite_border,
                                                                          color:
                                                                              Color(0xFF95A1AC),
                                                                          size:
                                                                              25,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            4,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.likes(socialFeedUserPostsRecord).toString(),
                                                                            '0',
                                                                          ),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyText2,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .mode_comment_outlined,
                                                                      color: Color(
                                                                          0xFF95A1AC),
                                                                      size: 24,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              4,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        socialFeedUserPostsRecord
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
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          2,
                                                                          8,
                                                                          0),
                                                                  child: Text(
                                                                    dateTimeFormat(
                                                                        'relative',
                                                                        socialFeedUserPostsRecord
                                                                            .timePosted!),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1,
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .ios_share,
                                                                  color: Color(
                                                                      0xFF95A1AC),
                                                                  size: 24,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    2, 4, 0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12,
                                                                            0,
                                                                            12,
                                                                            12),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    socialFeedUserPostsRecord
                                                                        .postDescription,
                                                                    'I\'m back with a super quick Instagram redesign just for the fan. Rounded corners and cute icons, what else do we need, haha.⁣ ',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
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
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
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
    );
  }
}
