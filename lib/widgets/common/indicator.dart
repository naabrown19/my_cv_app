import 'package:flutter/material.dart';
import '../../const/theme.dart';

class Indicator extends StatelessWidget {
  final bool isActive;

  Indicator(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? ThemeColors.SECONDARY : ThemeColors.SECONDARY_SHADE,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
