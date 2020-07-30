import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/services/app_localizations.dart';

PreferredSizeWidget myAppBar(String titleKey, BuildContext context) {
  return AppBar(
    title: Text(
      AppLocalizations.of(context).translate(titleKey),
      style: TextStyle(
        fontSize: ThemeSizes.SUBTITLE,
        fontWeight: FontWeight.bold,
        color: ThemeColors.PRIMARY_TEXT
      ),
    ),
    backgroundColor: Colors.white,
    centerTitle: true,
    elevation: 0,
  );
}
