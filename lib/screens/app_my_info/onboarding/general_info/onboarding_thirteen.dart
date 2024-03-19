import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/services/app_localizations.dart';
import 'package:my_cv_app/widgets/onboarding/onboarding_title.dart';

class NannyOnboardingThirteenScreen extends StatefulWidget {
  final Function nextPage;
  NannyOnboardingThirteenScreen(this.nextPage);
  @override
  _NannyOnboardingThirteenScreenState createState() =>
      _NannyOnboardingThirteenScreenState();
}

class _NannyOnboardingThirteenScreenState
    extends State<NannyOnboardingThirteenScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4)).then((value) {
      widget.nextPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/flutter_logo.png',
                  height: 150,
                ),
                Image.asset(
                  'assets/images/firebase_logo.png',
                  height: 150,
                )
              ],
            ),
            Image.asset(
              'assets/images/node_logo.png',
              height: 125,
            ),
            const SizedBox(height: 30),
            OnboardingTitle('nanny_ob_thirteen_title'),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)
                      .translate('nanny_ob_thirteen_subtitle') ??
                  '',
              style: TextStyle(
                color: ThemeColors.GRAY_TEXT,
                fontSize: ThemeSizes.SUBTITLE,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
