import 'package:flutter/material.dart';
import 'package:my_cv_app/models/my_info.dart';
import 'package:my_cv_app/providers/my_info_data.dart';
import 'package:my_cv_app/screens/app_my_info/home_page_view.dart';
import 'package:my_cv_app/screens/app_my_info/onboarding/general_info/onboarding_eight.dart';
import 'package:my_cv_app/screens/app_my_info/onboarding/general_info/onboarding_five.dart';
import 'package:my_cv_app/screens/app_my_info/onboarding/general_info/onboarding_four.dart';
import 'package:my_cv_app/screens/app_my_info/onboarding/general_info/onboarding_seven.dart';
import 'package:my_cv_app/screens/app_my_info/onboarding/general_info/onboarding_six.dart';
import 'package:my_cv_app/screens/app_my_info/onboarding/general_info/onboarding_thirteen.dart';
import 'package:my_cv_app/screens/app_my_info/onboarding/general_info/onboarding_twelve.dart';
import 'package:my_cv_app/services/app_localizations.dart';
import 'package:my_cv_app/widgets/common/continue_button.dart';
import 'package:my_cv_app/widgets/common/language_selector.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../../../../const/theme.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class NannyGeneralInfoPageView extends StatefulWidget {
  @override
  _NannyGeneralInfoPageViewState createState() =>
      _NannyGeneralInfoPageViewState();
}

class _NannyGeneralInfoPageViewState extends State<NannyGeneralInfoPageView> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final int _numPages = 6;
  bool _isLoading = false;
  MyInfo _myInfo;
  bool _isInit = true;
  String _lang;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      _lang = Provider.of<MyInfoProvider>(context).currentLang;
      _myInfo = Provider.of<MyInfoProvider>(context, listen: false).nanny;
      //get lanuages, skills, special cares, questions
      String _locale = Localizations.localeOf(context).languageCode;
      print(_locale);
    }
    _isInit = false;
  }

  Future<void> _nextPage() async {
    _pageController.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _continue() {
    //go to profile screen
    Navigator.pushReplacement(
        context,
        PageTransition(
            child: NannyHomePageView(),
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 300)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.BACKGROUND,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: kIsWeb ? 500 : 1000),
                height: MediaQuery.of(context).size.height - 40,
                margin: EdgeInsets.symmetric(
                    horizontal: ThemeSizes.MARGIN, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LinearPercentIndicator(
                      progressColor: ThemeColors.PRIMARY_DARK,
                      backgroundColor: ThemeColors.PRIMARY.withOpacity(0.2),
                      percent: _currentPage / _numPages,
                      width:
                          kIsWeb ? 500 : MediaQuery.of(context).size.width - 32,
                      lineHeight: 10,
                      animateFromLastPercent: true,
                      animation: true,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        margin:
                            EdgeInsets.symmetric(vertical: ThemeSizes.MARGIN),
                        child: Stack(
                          children: [
                            PageView(
                              controller: _pageController,
                              physics: _currentPage == _numPages
                                  ? NeverScrollableScrollPhysics()
                                  : ScrollPhysics(),
                              onPageChanged: (int page) {
                                setState(() {
                                  _currentPage = page;
                                });
                              },
                              children: [
                                NannyOnboardingFourScreen(_myInfo, _nextPage),
                                NannyOnboardingFiveScreen(_myInfo, _nextPage),
                                NannyOnboardingSixScreen(_myInfo, _nextPage),
                                NannyOnboardingSevenScreen(_myInfo, _nextPage),
                                NannyOnboardingEightScreen(_myInfo, _nextPage),
                                NannyOnboardingTwelveScreen(_myInfo, _nextPage),
                                NannyOnboardingThirteenScreen(_continue)
                              ],
                            ),
                            LanguageSelector(),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Column(
                        children: [
                          ContinueButton(
                              text: _currentPage == _numPages
                                  ? 'finish'
                                  : 'continue',
                              onPressed: _currentPage == _numPages
                                  ? _continue
                                  : _nextPage,
                              isLoading: _isLoading),
                          InkWell(
                            onTap: () {
                              if (_currentPage != 0 ||
                                  _currentPage == _numPages) {
                                _pageController.previousPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 16.0),
                              child: Text(
                                _currentPage == 0 || _currentPage == _numPages
                                    ? ''
                                    : AppLocalizations.of(context)
                                        .translate('back'),
                                style: TextStyle(
                                    color: ThemeColors.GRAY_TEXT,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
