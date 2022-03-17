import 'package:flutter/material.dart';
import 'package:my_cv_app/providers/my_info_data.dart';
import 'package:my_cv_app/screens/app_my_info/onboarding/general_info/general_info_page_view.dart';
import 'package:my_cv_app/services/app_localizations.dart';
import 'package:my_cv_app/widgets/common/continue_button.dart';
import 'package:my_cv_app/widgets/common/language_selector.dart';
import 'package:my_cv_app/widgets/onboarding/account_type_container.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../../const/theme.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class SelectAccountScreen extends StatefulWidget {
  static const routeName = '/select-account-type';
  final String email;
  final String name;
  final String lastName;
  SelectAccountScreen({this.email, this.lastName, this.name});
  @override
  _SelectAccountScreenState createState() => _SelectAccountScreenState();
}

class _SelectAccountScreenState extends State<SelectAccountScreen> {
  bool _isFull = false;
  bool _isFront = false;
  bool _isBack = false;
  bool _isLoading = false;
  String _lang;

  @override
  void initState() {
    super.initState();
    _selectAccount();
  }

  void _selectAccount() {
    Future.delayed(Duration(milliseconds: 1000)).then((value) {
      setState(() {
        _isFull = true;
      });
    }).then((value) {
      Future.delayed(Duration(milliseconds: 2000)).then((value) {
        _continueAndSetUpAccount();
      });
    });
  }

  Future<void> _continueAndSetUpAccount() async {
    Navigator.pushReplacement(
        context,
        PageTransition(
            child: NannyGeneralInfoPageView(),
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 300)));
  }

  @override
  Widget build(BuildContext context) {
    _lang = Provider.of<MyInfoProvider>(context).currentLang;
    return Scaffold(
      backgroundColor: ThemeColors.BACKGROUND,
      body: Center(
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints(maxWidth: kIsWeb ? 500 : 1000),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login/bg-circles.png'),
                fit: BoxFit.cover),
          ),
          child: Container(
            margin: EdgeInsets.all(ThemeSizes.MARGIN),
            child: Stack(
              children: [
                LanguageSelector(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 180,
                      width: 180,
                      padding: EdgeInsets.all(5.0),
                      child: FlutterLogo(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        AppLocalizations.of(context)
                            .translate('select_account_type'),
                        style: TextStyle(
                            color: ThemeColors.DARK_GRAY,
                            fontSize: ThemeSizes.CAPTION),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isFull = true;
                              _isFront = false;
                              _isBack = false;
                            });
                          },
                          child: AccountTypeContainer(
                              'Full-Stack',
                              Column(
                                children: [
                                  FlutterLogo(),
                                  Image.asset(
                                    'assets/images/firebase_logo.png',
                                    height: 24,
                                  ),
                                  Image.asset(
                                    'assets/images/node_logo.png',
                                    height: 24,
                                  )
                                ],
                              ),
                              _isFull ? ThemeColors.PRIMARY : Colors.white),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isFront = true;
                              _isFull = false;
                              _isBack = false;
                            });
                          },
                          child: AccountTypeContainer(
                              'Front-End',
                              FlutterLogo(),
                              _isFront ? ThemeColors.PRIMARY : Colors.white),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _isFront = false;
                              _isFull = false;
                              _isBack = true;
                            });
                          },
                          child: AccountTypeContainer(
                              'Back-End',
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/images/firebase_logo.png',
                                    height: 24,
                                  ),
                                  Image.asset(
                                    'assets/images/node_logo.png',
                                    height: 24,
                                  )
                                ],
                              ),
                              _isFront ? ThemeColors.PRIMARY : Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _isFull
                        ? Text(
                            AppLocalizations.of(context)
                                .translate('full_account_type'),
                            style: TextStyle(
                                color: ThemeColors.PRIMARY,
                                fontWeight: FontWeight.bold,
                                fontSize: ThemeSizes.PARAGRAPH),
                            textAlign: TextAlign.center,
                          )
                        : _isFront
                            ? Text(
                                AppLocalizations.of(context)
                                    .translate('front_account_type'),
                                style: TextStyle(
                                    color: ThemeColors.PRIMARY,
                                    fontWeight: FontWeight.bold,
                                    fontSize: ThemeSizes.PARAGRAPH),
                                textAlign: TextAlign.center,
                              )
                            : Container(),
                    const SizedBox(height: 20),
                    if (_isFull || _isFront)
                      Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: ContinueButton(
                            text: 'continue',
                            onPressed: _continueAndSetUpAccount,
                            isLoading: _isLoading),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
