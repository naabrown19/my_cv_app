import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/providers/my_info_data.dart';
import 'package:my_cv_app/screens/login/initial_onboarding/initial_onboarding_1.dart';
import 'package:my_cv_app/screens/login/initial_onboarding/initial_onboarding_2.dart';
import 'package:my_cv_app/screens/login/initial_onboarding/initial_onboarding_3.dart';
import 'package:my_cv_app/screens/login/login_screen.dart';
import 'package:my_cv_app/widgets/common/continue_button.dart';
import 'package:my_cv_app/widgets/common/indicator.dart';
import 'package:my_cv_app/widgets/common/language_selector.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class InitialOnboardingPageView extends StatefulWidget {
  @override
  _InitialOnboardingPageViewState createState() =>
      _InitialOnboardingPageViewState();
}

class _InitialOnboardingPageViewState extends State<InitialOnboardingPageView> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final int _numPages = 3;
  String? _lang;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then((value) {
      Provider.of<MyInfoProvider>(context, listen: false)
          .setCurrentLang(Localizations.localeOf(context).languageCode);
    });
    Future.delayed(Duration(seconds: 2)).then((value) {
      _nextPage();
    });
  }

  void _nextPage() {
    if (_currentPage == 2) {
      _continue();
    } else {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      Future.delayed(Duration(seconds: 2)).then((value) {
        _nextPage();
      });
    }
  }

  void _continue() {
    //go to login screen
    Navigator.pushReplacement(
        context,
        PageTransition(
            child: LoginScreen(true),
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
    _lang = Provider.of<MyInfoProvider>(context).currentLang;
    return Scaffold(
      backgroundColor: ThemeColors.BACKGROUND,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(ThemeSizes.MARGIN),
          height: double.infinity,
          width: double.infinity,
          constraints: BoxConstraints(maxWidth: kIsWeb ? 600 : 1000),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LanguageSelector(),
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
                    InitialOnboarding1(),
                    InitialOnboarding2(),
                    InitialOnboarding3()
                  ],
                ),
              ),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ContinueButton(text: "continue", onPressed: () {}),
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
      ),
    );
  }
}
