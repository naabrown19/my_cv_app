import 'package:flutter/material.dart';
import 'package:my_cv_app/services/app_localizations.dart';
import '../../const/theme.dart';

class OnboardingTitle extends StatelessWidget {
  final String titleKey;
  OnboardingTitle(this.titleKey);
  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context).translate(titleKey),
      style: TextStyle(
        color: ThemeColors.PRIMARY,
        fontSize: ThemeSizes.TITLE,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
