          import 'package:flutter/material.dart';
import 'package:my_cv_app/services/app_localizations.dart';
import 'package:my_cv_app/widgets/onboarding/onboarding_title.dart';
import '../../../../const/theme.dart';

class NannyOnboardingOneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(ThemeSizes.MARGIN),
          child: Image.asset(
            'assets/images/onboarding/ob_nanny_one.png',
            height: 300,
          ),
        ),
        const SizedBox(height: 30),
        OnboardingTitle('nanny_ob_one_title'),
        const SizedBox(height: 20),
        Text(
          AppLocalizations.of(context).translate('nanny_ob_one_subtitle'),
          style: TextStyle(
            color: ThemeColors.GRAY_TEXT,
            fontSize: ThemeSizes.SUBTITLE,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
