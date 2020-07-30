import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/widgets/onboarding/onboarding_title.dart';

class InitialOnboarding3 extends StatelessWidget {
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/firebase_logo.png',
                    height: 150,
                  ),
                  Image.asset(
                    'assets/images/node_logo.png',
                    height: 100,
                  )
                ],
              ),
            ),
          ),
          OnboardingTitle('login_ob_3'),
        ],
      ),
    );
  }
}
