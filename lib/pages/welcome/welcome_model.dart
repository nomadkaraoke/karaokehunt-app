import '/flutter_flow/flutter_flow_util.dart';
import 'welcome_widget.dart' show WelcomeWidget;
import 'package:flutter/material.dart';

class WelcomeModel extends FlutterFlowModel<WelcomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for OnboardingPageView widget.
  PageController? onboardingPageViewController;

  int get onboardingPageViewCurrentIndex =>
      onboardingPageViewController != null &&
              onboardingPageViewController!.hasClients &&
              onboardingPageViewController!.page != null
          ? onboardingPageViewController!.page!.round()
          : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
