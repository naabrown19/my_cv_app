import 'package:flutter/material.dart';
import 'package:my_cv_app/services/app_localizations.dart';

import '../../const/theme.dart';

class LoginButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  final bool isLoading;
  final Image? icon;
  LoginButton({this.text, this.onPressed, this.isLoading = false, this.icon});

  @override
  Widget build(BuildContext context) {
    bool _isLogin = text == 'login' || text == 'sign_up';
    return InkWell(
      onTap: isLoading ? () {} : onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: ThemeSizes.MARGIN / 2),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: _isLogin ? ThemeColors.SECONDARY : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: _isLogin
                ? Border.all(width: 0)
                : Border.all(color: ThemeColors.PRIMARY_TEXT)),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width - 32,
        height: 40,
        child: isLoading
            ? CircularProgressIndicator()
            : Row(
                mainAxisAlignment: icon != null
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                children: [
                  if (icon != null)
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: icon,
                    ),
                  if (icon != null) const SizedBox(width: 10),
                  Text(
                    text != null
                        ? AppLocalizations.of(context).translate(text!) ?? ''
                        : (text ?? ''),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: _isLogin ? Colors.white : ThemeColors.PRIMARY_TEXT,
                      fontSize: ThemeSizes.SUBTITLE,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
