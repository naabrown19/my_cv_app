import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/services/app_localizations.dart';

class QuestionButton extends StatelessWidget {
  final String? labelKey;
  final bool isSelected;
  final Function()? onPressed;
  final Color? color;
  final double? width;
  final double? fontSize;
  QuestionButton({
    this.labelKey,
    this.isSelected = false,
    this.onPressed,
    this.color,
    this.width,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(maxWidth: kIsWeb ? 500 : 1000),
        padding: EdgeInsets.all(2.0),
        width: width != null ? width : MediaQuery.of(context).size.width * 0.4,
        height: 40,
        decoration: BoxDecoration(
            color: isSelected
                ? color != null
                    ? color
                    : ThemeColors.PRIMARY
                : Colors.white,
            border: Border.all(color: ThemeColors.PRIMARY, width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: FittedBox(
          child: Text(
            labelKey != null
                ? AppLocalizations.of(context).translate(labelKey!) ?? ''
                : labelKey ?? '',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected
                  ? color != null
                      ? color
                      : Colors.white
                  : ThemeColors.PRIMARY,
            ),
          ),
        ));
  }
}
