import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/models/my_info.dart';
import 'package:my_cv_app/services/app_localizations.dart';
import 'package:my_cv_app/widgets/onboarding/experience_row.dart';

class NannyOnboardingSevenScreen extends StatefulWidget {
  final MyInfo myInfo;
  final Function nextPage;
  NannyOnboardingSevenScreen(this.myInfo, this.nextPage);
  @override
  _NannyOnboardingSevenScreenState createState() =>
      _NannyOnboardingSevenScreenState();
}

class _NannyOnboardingSevenScreenState
    extends State<NannyOnboardingSevenScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      widget.nextPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Text(
                AppLocalizations.of(context).translate('nanny_ob_seven_title'),
                style: TextStyle(
                    color: ThemeColors.SECONDARY,
                    fontSize: ThemeSizes.TITLE,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              width: double.infinity,
              child: Text(
                AppLocalizations.of(context)
                    .translate('nanny_ob_seven_subtitle'),
                style: TextStyle(
                  color: ThemeColors.GRAY_TEXT,
                  fontSize: ThemeSizes.SUBTITLE,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)
                  .translate('nanny_ob_seven_experience'),
              style: TextStyle(
                  color: ThemeColors.DARK_GRAY, fontSize: ThemeSizes.PARAGRAPH),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ExperienceRow(
                      textKey: 'nanny_ob_seven_baby',
                      nanny: widget.myInfo,
                      nannyKey: 'flutter',
                      index: 1,
                    ),
                    ExperienceRow(
                      imagePath: 'assets/images/firebase_logo.png',
                      textKey: 'nanny_ob_seven_young',
                      nanny: widget.myInfo,
                      nannyKey: 'firebase',
                      index: 2,
                    ),
                    ExperienceRow(
                      imagePath: 'assets/images/node_logo.png',
                      textKey: 'nanny_ob_seven_old',
                      nanny: widget.myInfo,
                      nannyKey: 'node',
                      index: 3,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
