import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_cv_app/const/dummy_data.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/models/language.dart';
import 'package:my_cv_app/models/my_info.dart';
import 'package:my_cv_app/providers/my_info_data.dart';
import 'package:my_cv_app/screens/app_my_info/profile_stack/portfolio_widget.dart';
import 'package:my_cv_app/services/app_localizations.dart';
import 'package:my_cv_app/widgets/common/skills_grid.dart';
import 'package:provider/provider.dart';

class ProfileDetails extends StatelessWidget {
  ProfileDetails(
    this.isNanny, {
    this.nannyId,
  });

  final bool isNanny;
  final String? nannyId;

  final f = DateFormat("MMM-yy");

  @override
  Widget build(BuildContext context) {
    MyInfo _myInfo;
    Language? _nativeLang;
    Map<Language, String> _languages = {};

    List<Language> _savedLanguages;

    _myInfo = Provider.of<MyInfoProvider>(context).myInfo;
    _savedLanguages = DUMMY_LANGUAGES;

    if (_savedLanguages.length > 0) {
      _nativeLang = _savedLanguages
          .where((lan) => lan.id == _myInfo.nativeLanguageId)
          .firstOrNull;
      _myInfo.otherLanguages?.forEach((key, value) {
        _languages[_savedLanguages.where((lan) => lan.id == key).first] = value;
      });
    }
    if (_nativeLang != null) {
      _languages[_nativeLang] = 'native';
    }

    return Container(
      padding: EdgeInsets.all(12.0),
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 8.0),
          Container(
            width: double.infinity,
            child: Text(
              AppLocalizations.of(context).translate(_myInfo.description) ?? '',
              style: TextStyle(
                  color: ThemeColors.PRIMARY_TEXT,
                  fontSize: ThemeSizes.PARAGRAPH),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)
                        .translate('experience')
                        ?.toUpperCase() ??
                    '',
                style: TextStyle(
                    color: ThemeColors.GRAY_TEXT,
                    fontSize: ThemeSizes.PARAGRAPH,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (_myInfo.experiences.containsKey('flutter') &&
                  (int.tryParse((_myInfo.experiences['flutter'] ?? '6')) ?? 6) >
                      0)
                Column(
                  children: [
                    Container(height: 60, width: 60, child: FlutterLogo()),
                    const SizedBox(height: 5),
                    Text(
                      'Flutter',
                      style: TextStyle(
                          color: ThemeColors.PRIMARY_TEXT,
                          fontSize: ThemeSizes.PARAGRAPH,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${_myInfo.experiences['flutter']} ${AppLocalizations.of(context).translate('nanny_ob_seven_years')}',
                      style: TextStyle(
                          color: ThemeColors.DARK_GRAY,
                          fontSize: ThemeSizes.CAPTION),
                    )
                  ],
                ),
              if (_myInfo.experiences.containsKey('firebase') &&
                  int.parse((_myInfo.experiences['firebase'] ?? '6')) > 0)
                Column(
                  children: [
                    Image.asset(
                      'assets/images/firebase_logo.png',
                      height: 60,
                      width: 60,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Firebase',
                      style: TextStyle(
                          color: ThemeColors.PRIMARY_TEXT,
                          fontSize: ThemeSizes.PARAGRAPH,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${_myInfo.experiences['firebase']} ${AppLocalizations.of(context).translate('nanny_ob_seven_years')}',
                      style: TextStyle(
                          color: ThemeColors.DARK_GRAY,
                          fontSize: ThemeSizes.CAPTION),
                    )
                  ],
                ),
              if (_myInfo.experiences.containsKey('node') &&
                  int.parse((_myInfo.experiences['node'] ?? '5')) > 0)
                Column(
                  children: [
                    Image.asset(
                      'assets/images/node_logo.png',
                      height: 60,
                      width: 60,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Node.JS',
                      style: TextStyle(
                          color: ThemeColors.PRIMARY_TEXT,
                          fontSize: ThemeSizes.PARAGRAPH,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${_myInfo.experiences['node']} ${AppLocalizations.of(context).translate('nanny_ob_seven_years')}',
                      style: TextStyle(
                          color: ThemeColors.GRAY_TEXT,
                          fontSize: ThemeSizes.CAPTION),
                    )
                  ],
                ),
            ],
          ),
          const SizedBox(height: 20),
          //education section
          Container(
            width: double.infinity,
            child: Text(
              AppLocalizations.of(context).translate('work_experience') ?? '',
              style: TextStyle(
                  color: ThemeColors.GRAY_TEXT,
                  fontSize: ThemeSizes.PARAGRAPH,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(width: 10),
          _myInfo.workExperience.length == 0
              ? Text('')
              : ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _myInfo.workExperience.length,
                  itemBuilder: (context, index) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _myInfo.workExperience[index].jobTitle,
                        style: TextStyle(
                          color: ThemeColors.PRIMARY_TEXT,
                          fontSize: ThemeSizes.SUBTITLE,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${_myInfo.workExperience[index].companyName}\n${f.format(_myInfo.workExperience[index].startDate)} to ${f.format(_myInfo.workExperience[index].endDate)}',
                        style: TextStyle(
                            color: ThemeColors.DARK_GRAY,
                            fontSize: ThemeSizes.PARAGRAPH),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)
                        .translate('portfolio')
                        ?.toUpperCase() ??
                    '',
                style: TextStyle(
                    color: ThemeColors.GRAY_TEXT,
                    fontSize: ThemeSizes.PARAGRAPH,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          //PORTFOLIO
          Column(
            children: [
              PortfolioWidget(
                title: 'General',
                links: [
                  Link(
                    'GitHub',
                    'https://github.com/naabrown19',
                  ),
                ],
              ),
              PortfolioWidget(
                title: 'Cufflink.io',
                links: [Link('Website', 'https://cufflink.io')],
              ),
              PortfolioWidget(
                title: 'Mamá Gallina Sitters',
                links: [
                  Link('Website', 'https://mamagallinasitters.com'),
                  Link('Demo',
                      'https://youtube.com/playlist?list=PLjHM2KD9CFjSxZe4CYk7jzf67PcvaxbaG'),
                ],
              ),
              PortfolioWidget(
                title: 'HelpJack.io',
                links: [
                  Link('Website', 'https://helpjack.io'),
                  Link('Demo', 'https://youtu.be/w70pAYlkdPU'),
                ],
              ),
              PortfolioWidget(
                title: 'Portal.app',
                links: [
                  Link('Demo', 'https://portaldev-cf275.web.app'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)
                        .translate('skills')
                        ?.toUpperCase() ??
                    '',
                style: TextStyle(
                    color: ThemeColors.GRAY_TEXT,
                    fontSize: ThemeSizes.PARAGRAPH,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          //get skills
          SkillsGrid(nanny: _myInfo, editMode: false),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)
                        .translate('education')
                        ?.toUpperCase() ??
                    '',
                style: TextStyle(
                    color: ThemeColors.GRAY_TEXT,
                    fontSize: ThemeSizes.PARAGRAPH,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _myInfo.education.length == 0
              ? Text(
                  AppLocalizations.of(context).translate('no_education') ?? '',
                  textAlign: TextAlign.center,
                )
              : ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _myInfo.education.length,
                  itemBuilder: (context, index) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _myInfo.education[index].title,
                        style: TextStyle(
                          color: ThemeColors.PRIMARY_TEXT,
                          fontSize: ThemeSizes.SUBTITLE,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${_myInfo.education[index].institute},(${_myInfo.education[index].year})',
                        style: TextStyle(
                            color: ThemeColors.GRAY_TEXT,
                            fontSize: ThemeSizes.PARAGRAPH),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)
                        .translate('languages')
                        ?.toUpperCase() ??
                    '',
                style: TextStyle(
                    color: ThemeColors.GRAY_TEXT,
                    fontSize: ThemeSizes.PARAGRAPH,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          //GET LANGUAGES
          if (_languages.length > 0)
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _languages.keys.elementAt(index).title,
                      style: TextStyle(
                          color: ThemeColors.PRIMARY_TEXT,
                          fontSize: ThemeSizes.PARAGRAPH,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(AppLocalizations.of(context)
                            .translate(_languages.values.elementAt(index)) ??
                        '')
                  ],
                ),
              ),
              itemCount: _languages.length,
            ),
        ],
      ),
    );
  }
}
