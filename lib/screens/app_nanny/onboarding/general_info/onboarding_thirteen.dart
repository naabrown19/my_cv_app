import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/services/app_localizations.dart';
import 'package:my_cv_app/widgets/onboarding/flutter_logo_animation.dart';
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
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              child: AnimatedFlutterLogo(),
            ),
            const SizedBox(height: 30),
            OnboardingTitle('nanny_ob_thirteen_title'),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)
                  .translate('nanny_ob_thirteen_subtitle'),
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
