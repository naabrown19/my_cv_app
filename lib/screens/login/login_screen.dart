import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/providers/nanny_data.dart';
import 'package:my_cv_app/screens/login/select_account_screen.dart';
import 'package:my_cv_app/services/app_localizations.dart';
import 'package:my_cv_app/widgets/common/language_selector.dart';
import 'package:my_cv_app/widgets/common/login_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  final bool isLogin;
  LoginScreen(this.isLogin);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLogin = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  String _email = 'naabrown19@gmail.com';
  int _currentStep = 0;
  bool _isLoading = false;
  bool _isLoadingCB = false;
  bool _isLoadingFB = false;
  bool _isLoadingG = false;
  bool _isLoadingA = false;
  String _lang;
  @override
  void initState() {
    super.initState();
    _isLogin = widget.isLogin;
    _emailInput();
  }

  void _emailInput() {
    if (_email == _emailController.text) {
      Future.delayed(Duration(seconds: 1)).then((value) {
        _loginWithEmail();
      });
    } else {
      setState(() {
        _emailController.text = _email.substring(0, _currentStep);
        _currentStep += 1;
      });
      Future.delayed(Duration(milliseconds: 70)).then((value) {
        _emailInput();
      });
    }
  }

  Future<void> _loginWithEmail() async {
    Navigator.pushReplacement(
        context,
        PageTransition(
            child: SelectAccountScreen(
              email: _emailController.text,
            ),
            type: PageTransitionType.fade,
            duration: Duration(milliseconds: 300)));
  }

  Future<void> _loginWithFacebook() async {
    setState(() {
      _isLoadingFB = true;
      _isLoading = true;
    });
    setState(() {
      _isLoadingFB = false;
      _isLoading = false;
    });
  }

  Future<void> _loginWithGoogle() async {
    setState(() {
      _isLoadingG = true;
      _isLoading = true;
    });

    setState(() {
      _isLoadingG = false;
      _isLoading = false;
    });
  }

  Future<void> _loginWithApple() async {
    setState(() {
      _isLoadingA = true;
      _isLoading = true;
    });

    setState(() {
      _isLoadingA = false;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    _lang = Provider.of<MyInfoProvider>(context).currentLang;
    return Scaffold(
      backgroundColor: ThemeColors.BACKGROUND,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: kIsWeb ? 500 : 1000),
                alignment: Alignment.center,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context).translate('welcome'),
                            style: TextStyle(
                              fontSize: ThemeSizes.HEADING,
                              color: ThemeColors.PRIMARY,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 180,
                            padding: EdgeInsets.all(5.0),
                            child: FlutterLogo(
                              style: FlutterLogoStyle.markOnly,
                              size: 180,
                              curve: Curves.fastOutSlowIn,
                            ),
                          ),
                          const SizedBox(height: 80),
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 5.0),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          ThemeSizes.BORDER_RADIUS)),
                                  child: TextFormField(
                                    controller: _emailController,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15,
                                          bottom: 11,
                                          top: 11,
                                          right: 15),
                                      icon: const Icon(Icons.email),
                                      hintText: AppLocalizations.of(context)
                                          .translate('email_address'),
                                      labelText: AppLocalizations.of(context)
                                          .translate('email_address'),
                                    ),
                                    validator: (val) {
                                      if (!RegExp(
                                              r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                          .hasMatch(val)) {
                                        return 'This is not a valid email';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Column(
                                  children: [
                                    LoginButton(
                                        text: _isLogin ? 'login' : 'sign_up',
                                        onPressed: () {},
                                        isLoading: _isLoadingCB),
                                    LoginButton(
                                      text: 'continue_w_facebook',
                                      onPressed: _isLoading
                                          ? () {}
                                          : _loginWithFacebook,
                                      isLoading: _isLoadingFB,
                                      icon: Image.asset(
                                        'assets/images/login/icon-facebook.png',
                                      ),
                                    ),
                                    LoginButton(
                                      text: kIsWeb
                                          ? 'continue_w_google'
                                          : Platform.isAndroid
                                              ? 'continue_w_google'
                                              : 'continue_w_apple',
                                      onPressed: _isLoading
                                          ? () {}
                                          : kIsWeb
                                              ? _loginWithGoogle
                                              : Platform.isAndroid
                                                  ? _loginWithGoogle
                                                  : _loginWithApple,
                                      isLoading: kIsWeb
                                          ? _isLoadingG
                                          : Platform.isAndroid
                                              ? _isLoadingG
                                              : _isLoadingA,
                                      icon: kIsWeb
                                          ? Image.asset(
                                              'assets/images/login/icon-google.png',
                                            )
                                          : Platform.isAndroid
                                              ? Image.asset(
                                                  'assets/images/login/icon-google.png',
                                                )
                                              : Image.asset(
                                                  'assets/images/login/icon-apple.png',
                                                ),
                                    ),
                                    if (kIsWeb)
                                      LoginButton(
                                        text: 'continue_w_apple',
                                        onPressed: _isLoading
                                            ? () {}
                                            : _loginWithApple,
                                        isLoading: _isLoadingA,
                                        icon: Image.asset(
                                          'assets/images/login/icon-apple.png',
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(AppLocalizations.of(context)
                                .translate('forgot_password')),
                          ),
                          SizedBox(
                            height: !_isLogin ? 10 : 40,
                          ),
                          if (!_isLogin)
                            InkWell(
                              onTap: () async {
                                const url = 'http://www.mamagallinasitters.com';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: Text(
                                AppLocalizations.of(context)
                                    .translate('login_terms'),
                                style: TextStyle(color: ThemeColors.GRAY_TEXT),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            },
                            child: Text(_isLogin
                                ? AppLocalizations.of(context)
                                    .translate('no_account')
                                : AppLocalizations.of(context)
                                    .translate('has_account')),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
