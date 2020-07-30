import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/services/app_localizations.dart';

class BottomNavigationNanny extends StatelessWidget {
  final Function selectPage;
  final int selectedPageIndex;
  BottomNavigationNanny(this.selectPage, this.selectedPageIndex);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      // type: BottomNavigationBarType.shifting,
      elevation: 4,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.person_outline,
            color: ThemeColors.SECONDARY,
          ),
          backgroundColor: Colors.white,
          icon: Icon(
            Icons.person_outline,
            color: ThemeColors.DARK_GRAY,
          ),
          title: Text(
            AppLocalizations.of(context).translate('profile'),
            style: TextStyle(color: ThemeColors.SECONDARY),
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(
            Icons.calendar_today,
            color: ThemeColors.SECONDARY,
          ),
          backgroundColor: Colors.white,
          icon: Icon(
            Icons.calendar_today,
            color: ThemeColors.DARK_GRAY,
          ),
          title:
              Text(AppLocalizations.of(context).translate('calendar'), style: TextStyle(color: ThemeColors.SECONDARY)),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          activeIcon: Icon(Icons.message, color: ThemeColors.SECONDARY),
          icon: Icon(
            Icons.message,
            color: ThemeColors.DARK_GRAY,
          ),
          title:
              Text(AppLocalizations.of(context).translate('messages'), style: TextStyle(color: ThemeColors.SECONDARY)),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          activeIcon: Icon(
            Icons.notifications,
            color: ThemeColors.SECONDARY,
          ),
          icon: Icon(
            Icons.notifications,
            color: ThemeColors.DARK_GRAY,
          ),
          title: Text(AppLocalizations.of(context).translate('notifications'),
              style: TextStyle(color: ThemeColors.SECONDARY)),
        ),
      ],
      selectedItemColor: ThemeColors.SECONDARY,
      currentIndex: selectedPageIndex,
      unselectedIconTheme: IconThemeData(size: 24),
      selectedIconTheme: IconThemeData(size: 32),
      selectedFontSize: 14,
      unselectedFontSize: 12,
      onTap: selectPage,
    );
  }
}
