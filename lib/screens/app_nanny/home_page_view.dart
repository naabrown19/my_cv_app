import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/screens/app_nanny/bottom_navigation.dart';
import 'package:my_cv_app/screens/app_nanny/profile_stack/profile_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class NannyHomePageView extends StatefulWidget {
  @override
  _NannyHomePageViewState createState() => _NannyHomePageViewState();
}

class _NannyHomePageViewState extends State<NannyHomePageView> {
  List<Widget> _pages = [
    ProfileScreen(),
  ];
  int _selectedPageIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  void selectPage(int index) {
    _pageController.jumpToPage(index);
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.BACKGROUND,
      body: Container(
        constraints: BoxConstraints(maxWidth: kIsWeb ? 600 : 1000),
        child: PageView(
                controller: _pageController,
                onPageChanged: (page) {
                  selectPage(page);
                },
                children: _pages,
              ),
      ),
      bottomNavigationBar:
          BottomNavigationNanny(selectPage, _selectedPageIndex),
    );
  }
}
