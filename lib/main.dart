import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_cv_app/locator.dart';
import 'package:my_cv_app/providers/my_info_data.dart';
import 'package:my_cv_app/screens/login/initial_onboarding/initial_onboarding_page_view.dart';
import 'package:my_cv_app/screens/login/login_screen.dart';
import 'package:my_cv_app/screens/login/select_account_screen.dart';
import 'package:my_cv_app/services/config_reader.dart';
import 'package:provider/provider.dart';

import 'const/theme.dart';
import 'services/app_localizations.dart';

Future<void> main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await ConfigReader.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: getIt<MyInfoProvider>(),
        ),
      ],
      child: MaterialApp(
        title: 'About Neil',
        theme: ThemeData(
            useMaterial3: false,
            backgroundColor: ThemeColors.BACKGROUND,
            primaryColor: ThemeColors.PRIMARY,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Muli'),
        supportedLocales: [
          Locale('en', 'US'),
          Locale('es', 'MX'),
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode ||
                supportedLocale.countryCode == locale?.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        home: InitialOnboardingPageView(),
        routes: {
          LoginScreen.routeName: (ctx) => LoginScreen(true),
          SelectAccountScreen.routeName: (ctx) => SelectAccountScreen()
        },
      ),
    );
  }
}
