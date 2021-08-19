import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/screens/app_nanny/profile_stack/profile_details.dart';
import 'package:my_cv_app/screens/app_nanny/profile_stack/reviews.dart';
import 'package:my_cv_app/services/app_localizations.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MainSectionPageView extends StatefulWidget {
  @override
  _MainSectionPageViewState createState() => _MainSectionPageViewState();
}

class _MainSectionPageViewState extends State<MainSectionPageView> {
  final PageController _profileController = PageController(initialPage: 0);
  int _selectedPageIndex;

  @override
  void initState() {
    super.initState();
    _selectedPageIndex = 0;
  }

  void selectPage(int index) {
    _profileController.jumpToPage(index);
    // _profileController.animateToPage(index,
    //     duration: Duration(milliseconds: 400), curve: Curves.easeIn);
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 30,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ThemeColors.PRIMARY.withOpacity(0.3),
            borderRadius: BorderRadius.circular(ThemeSizes.BORDER_RADIUS),
          ),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: InkWell(
                  onTap: () => selectPage(0),
                  child: AnimatedContainer(
                    duration: _selectedPageIndex == 0
                        ? Duration(milliseconds: 300)
                        : Duration.zero,
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: _selectedPageIndex == 0
                            ? ThemeColors.PRIMARY
                            : Colors.transparent,
                        borderRadius:
                            BorderRadius.circular(ThemeSizes.BORDER_RADIUS)),
                    child: Text(
                      AppLocalizations.of(context).translate('about_me'),
                      style: TextStyle(
                          color: _selectedPageIndex == 0
                              ? Colors.white
                              : ThemeColors.PRIMARY,
                          fontSize: ThemeSizes.SUBTITLE,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: InkWell(
                  onTap: () => selectPage(1),
                  child: AnimatedContainer(
                    duration: _selectedPageIndex == 1
                        ? Duration(milliseconds: 300)
                        : Duration.zero,
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        color: _selectedPageIndex == 1
                            ? ThemeColors.PRIMARY
                            : Colors.transparent,
                        borderRadius:
                            BorderRadius.circular(ThemeSizes.BORDER_RADIUS)),
                    child: Text(
                      AppLocalizations.of(context).translate('reviews'),
                      style: TextStyle(
                          color: _selectedPageIndex == 1
                              ? Colors.white
                              : ThemeColors.PRIMARY,
                          fontSize: ThemeSizes.SUBTITLE,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: kIsWeb ? 1250 : _selectedPageIndex == 0 ? 1100 : 200,
          margin: EdgeInsets.only(bottom: 8.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(ThemeSizes.BORDER_RADIUS),
                  bottomRight: Radius.circular(ThemeSizes.BORDER_RADIUS))),
          child: PageView(
            controller: _profileController,
            children: [
              ProfileDetails(true),
              SingleChildScrollView(
                child: ReviewList(
                  isNanny: true,
                ),
              ),
            ],
            onPageChanged: (index) {
              setState(() {
                _selectedPageIndex = index;
              });
            },
          ),
        ),
      ],
    );
  }
}
