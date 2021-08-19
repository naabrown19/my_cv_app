import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                margin: EdgeInsets.all(ThemeSizes.MARGIN),
                child:
                    Image.asset('assets/images/flutter_logo.png', height: 250)),
          ),
          OnboardingTitle('login_ob_2'),
        ],
      ),
    );
  }
}
