import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/providers/nanny_data.dart';
import 'package:my_cv_app/screens/app_nanny/profile_stack/main_section_page_view.dart';
import 'package:my_cv_app/screens/app_nanny/profile_stack/top_section.dart';
import 'package:my_cv_app/screens/login/initial_onboarding/initial_onboarding_page_view.dart';
import 'package:my_cv_app/services/app_localizations.dart';
import 'package:my_cv_app/services/config_reader.dart';
import 'package:my_cv_app/widgets/common/app_bar.dart';
import 'package:my_cv_app/widgets/common/continue_button.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _lang = Provider.of<MyInfoProvider>(context).currentLang;
    return Scaffold(
      appBar: myAppBar('my_profile', context),
      body: Container(
        constraints: BoxConstraints(maxWidth: kIsWeb ? 600 : 1000),
        margin: EdgeInsets.only(
            top: ThemeSizes.MARGIN,
            left: ThemeSizes.MARGIN,
            right: ThemeSizes.MARGIN),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TopSection(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContinueButton(
                    text: 'cv',
                    buttonColor: ThemeColors.SECONDARY_SHADE,
                    textColor: Colors.white,
                    textWeight: FontWeight.bold,
                    onPressed: () async {
                      final url =
                          ConfigReader.getCvShareLink();
                      if (await canLaunch(url)) {
                        await launch(url,
                            forceSafariVC: false, forceWebView: false);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  )
                ],
              ),
              const SizedBox(height: 12),
              MainSectionPageView(),
              ContinueButton(
                text: AppLocalizations.of(context).translate('return_to_start'),
                buttonColor: ThemeColors.PRIMARY.withOpacity(0.2),
                textColor: ThemeColors.PRIMARY,
                textWeight: FontWeight.bold,
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: InitialOnboardingPageView(),
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 300)));
                },
              ),
              ContinueButton(
                text: AppLocalizations.of(context).translate('logout'),
                buttonColor: ThemeColors.RED.withOpacity(0.2),
                textColor: ThemeColors.RED,
                textWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
