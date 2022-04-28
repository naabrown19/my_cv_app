import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/services/app_localizations.dart';

class BottomNavigationNanny extends StatelessWidget {
  final Function selectPage;
  final int selectedPageIndex;
  BottomNavigationNanny(this.selectPage, this.selectedPageIndex);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: kIsWeb ? 600 : 1000),
      width: kIsWeb ? 500 : MediaQuery.of(context).size.width,
      child: BottomNavigationBar(
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
              label: AppLocalizations.of(context).translate('profile')),
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
            label: AppLocalizations.of(context).translate('calendar'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            activeIcon: Icon(Icons.message, color: ThemeColors.SECONDARY),
            icon: Icon(
              Icons.message,
              color: ThemeColors.DARK_GRAY,
            ),
            label: AppLocalizations.of(context).translate('messages'),
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
            label: AppLocalizations.of(context).translate('notifications'),
          ),
        ],
        selectedItemColor: ThemeColors.SECONDARY,
        currentIndex: selectedPageIndex,
        unselectedIconTheme: IconThemeData(size: 24),
        selectedIconTheme: IconThemeData(size: 32),
        selectedFontSize: 14,
        unselectedFontSize: 12,
        onTap: selectPage,
      ),
    );
  }
}
