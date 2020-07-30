import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/screens/app_nanny/profile_stack/main_section_page_view.dart';
import 'package:my_cv_app/screens/app_nanny/profile_stack/top_section.dart';
import 'package:my_cv_app/widgets/common/app_bar.dart';
import 'package:my_cv_app/widgets/common/continue_button.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    width: (MediaQuery.of(context).size.width - 32),
                    buttonColor: ThemeColors.SECONDARY_SHADE,
                    textColor: Colors.white,
                    textWeight: FontWeight.bold,
                    onPressed: () async {
                      final url = 'https://drive.google.com/file/d/1hEWdDYHSIng79ZzCeolOwciqr8l_sfpR/view?usp=sharing';
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
                text: 'Help & Support',
                buttonColor: ThemeColors.PRIMARY.withOpacity(0.2),
                textColor: ThemeColors.PRIMARY,
                textWeight: FontWeight.bold,
                onPressed: () async {},
              ),
              ContinueButton(
                text: 'Logout',
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
