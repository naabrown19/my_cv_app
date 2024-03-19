import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:my_cv_app/services/app_localizations.dart';

import '../../const/theme.dart';

class ContinueButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final double? width;
  final double? height;
  final Color? buttonColor;
  final Color? textColor;
  final bool isLoading;
  final Border? border;
  final FontWeight? textWeight;

  ContinueButton(
      {required this.text,
      this.buttonColor,
      this.textColor,
      this.textWeight,
      this.width,
      this.height,
      this.onPressed,
      this.border,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? () {} : onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        constraints: BoxConstraints(maxWidth: kIsWeb ? 568 : 1000),
        margin: EdgeInsets.symmetric(vertical: ThemeSizes.MARGIN / 2),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: buttonColor == null ? ThemeColors.SECONDARY : buttonColor,
            borderRadius: BorderRadius.circular(20),
            border: border == null
                ? Border.all(width: 0, color: Colors.transparent)
                : border),
        alignment: Alignment.center,
        width: width == null ? MediaQuery.of(context).size.width - 32 : width,
        height: height == null ? 40 : height,
        child: isLoading
            ? CircularProgressIndicator()
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context).translate(text) ?? text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: textColor == null ? Colors.white : textColor,
                        fontSize: ThemeSizes.PARAGRAPH,
                        fontWeight: textWeight == null
                            ? FontWeight.normal
                            : textWeight),
                  ),
                ],
              ),
      ),
    );
  }
}
