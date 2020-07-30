import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/widgets/onboarding/flutter_logo_animation.dart';
import 'package:my_cv_app/widgets/onboarding/onboarding_title.dart';

class InitialOnboarding2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(ThemeSizes.MARGIN),
      alignment: Alignment.center,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(ThemeSizes.MARGIN),
                child: AnimatedFlutterLogo()),
          ),
          OnboardingTitle('login_ob_2'),
        ],
      ),
    );
  }
}
