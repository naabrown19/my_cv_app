import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/widgets/onboarding/onboarding_title.dart';

class InitialOnboarding1 extends StatelessWidget {
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
              child: Image.asset('assets/images/login/ob_one.png',
                  height: 250, fit: BoxFit.cover),
            ),
          ),
          OnboardingTitle('login_ob_1'),
        ],
      ),
    );
  }
}
