import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/screens/app_nanny/onboarding/general_info/general_info_page_view.dart';
import 'package:my_cv_app/screens/app_nanny/onboarding/initial_onboarding/onboarding_one.dart';
import 'package:my_cv_app/screens/app_nanny/onboarding/initial_onboarding/onboarding_three.dart';
import 'package:my_cv_app/screens/app_nanny/onboarding/initial_onboarding/onboarding_two.dart';
import 'package:my_cv_app/widgets/common/continue_button.dart';
import 'package:my_cv_app/widgets/common/indicator.dart';
import 'package:page_transition/page_transition.dart';

class NannyOnboardingPageView extends StatefulWidget {
  @override
  _NannyOnboardingPageViewState createState() =>
      _NannyOnboardingPageViewState();
}

class _NannyOnboardingPageViewState extends State<NannyOnboardingPageView> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final int _numPages = 3;

  void _nextPage() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _continue() {
    //go to general info questions screen
    Navigator.pushReplacement(
        context,
        PageTransition(
            child: NannyGeneralInfoPageView(),
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 300)));
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? Indicator(true) : Indicator(false));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.BACKGROUND,
      body: Container(
        margin: EdgeInsets.all(ThemeSizes.MARGIN),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  NannyOnboardingOneScreen(),
                  NannyOnboardingTwoScreen(),
                  NannyOnboardingThreeScreen()
                ],
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ContinueButton(
                      text: "continue",
                      onPressed: _currentPage == 2 ? _continue : _nextPage),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
