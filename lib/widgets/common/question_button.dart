import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/services/app_localizations.dart';

class QuestionButton extends StatelessWidget {
  final String labelKey;
  final bool isSelected;
  final Function onPressed;
  final Color color;
  final double width;
  final double fontSize;
  QuestionButton({this.labelKey, this.isSelected, this.onPressed, this.color, this.width, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(2.0),
        width: width!=null?width:MediaQuery.of(context).size.width * 0.4,
        height: 40,
        decoration: BoxDecoration(
            color: isSelected
                ? color != null ? color : ThemeColors.PRIMARY
                : Colors.white,
            border: Border.all(color: ThemeColors.PRIMARY, width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: FittedBox(
                  child: Text(
            AppLocalizations.of(context).translate(labelKey)??labelKey,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: isSelected
                    ? color != null ? color : Colors.white
                    : ThemeColors.PRIMARY,
                ),
          ),
        ));
  }
}
