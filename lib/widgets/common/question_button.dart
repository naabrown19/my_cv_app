import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';

class QuestionButton extends StatelessWidget {
  final String? labelKey;
  final bool isSelected;
  final Function()? onPressed;
  final Color? color;
  final double? width;
  final double? fontSize;
  QuestionButton({
    this.labelKey,
    required this.isSelected,
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
          color: isSelected ? ThemeColors.PRIMARY : Colors.white,
          border: Border.all(color: ThemeColors.PRIMARY, width: 2),
          borderRadius: BorderRadius.circular(20)),
      child: Text(
        labelKey ?? '',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isSelected ? Colors.white : ThemeColors.PRIMARY,
        ),
      ),
    );
  }
}
