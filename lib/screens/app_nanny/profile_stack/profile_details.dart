import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:my_cv_app/const/dummy_data.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/models/language.dart';
import 'package:my_cv_app/models/nanny.dart';
import 'package:my_cv_app/providers/nanny_data.dart';
import 'package:my_cv_app/services/app_localizations.dart';
import 'package:my_cv_app/widgets/common/skills_grid.dart';
import 'package:provider/provider.dart';

class ProfileDetails extends StatelessWidget {
  final bool isNanny;
  final String nannyId;
  ProfileDetails(this.isNanny, {this.nannyId});

  final f = DateFormat("MMM-yy");

  @override
  Widget build(BuildContext context) {
    MyInfo _myInfo;
    Language _nativeLang;
    Map<Language, String> _languages = {};

    List<Language> _savedLanguages;

    if (isNanny) {
      _myInfo = Provider.of<MyInfoProvider>(context).nanny;
      _savedLanguages = DUMMY_LANGUAGES;

      if (_savedLanguages != null && _savedLanguages.length > 0) {
        _nativeLang = _savedLanguages
                .where((lan) => lan.id == _myInfo.nativeLanguageId)
                ?.first ??
            '';
        _myInfo.otherLanguages.forEach((key, value) {
          _languages[_savedLanguages.where((lan) => lan.id == key).first] =
              value;
        });
      }
      if (_nativeLang != null) {
        _languages[_nativeLang] = 'native';
      }
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
                    .toUpperCase(),
                style: TextStyle(
                    color: ThemeColors.GRAY_TEXT,
                    fontSize: ThemeSizes.PARAGRAPH,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (_myInfo.experiences != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_myInfo.experiences.containsKey('baby') &&
                    int.parse(_myInfo.experiences['baby']) > 0)
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
                        '${_myInfo.experiences['baby']} ${AppLocalizations.of(context).translate('nanny_ob_seven_years')}',
                        style: TextStyle(
                            color: ThemeColors.DARK_GRAY,
                            fontSize: ThemeSizes.CAPTION),
                      )
                    ],
                  ),
                if (_myInfo.experiences.containsKey('young') &&
                    int.parse(_myInfo.experiences['young']) > 0)
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
                        '${_myInfo.experiences['young']} ${AppLocalizations.of(context).translate('nanny_ob_seven_years')}',
                        style: TextStyle(
                            color: ThemeColors.DARK_GRAY,
                            fontSize: ThemeSizes.CAPTION),
                      )
                    ],
                  ),
                if (_myInfo.experiences.containsKey('old') &&
                    int.parse(_myInfo.experiences['old']) > 0)
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
                        '${_myInfo.experiences['old']} ${AppLocalizations.of(context).translate('nanny_ob_seven_years')}',
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
              AppLocalizations.of(context).translate('work_experience'),
              style: TextStyle(
                  color: ThemeColors.GRAY_TEXT,
                  fontSize: ThemeSizes.PARAGRAPH,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(width: 10),
          _myInfo.workExperience == null || _myInfo.workExperience.length == 0
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
                      const SizedBox(height:5),
                    ],
                  ),
                ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).translate('skills').toUpperCase(),
                style: TextStyle(
                    color: ThemeColors.GRAY_TEXT,
                    fontSize: ThemeSizes.PARAGRAPH,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          //get skills
          _myInfo.selectedSkills == null
              ? Text(AppLocalizations.of(context).translate('no_skills'))
              : SkillsGrid(nanny: _myInfo, editMode: false),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)
                    .translate('education')
                    .toUpperCase(),
                style: TextStyle(
                    color: ThemeColors.GRAY_TEXT,
                    fontSize: ThemeSizes.PARAGRAPH,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _myInfo.education == null || _myInfo.education.length == 0
              ? Text(
                  AppLocalizations.of(context).translate('no_education'),
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
                    .toUpperCase(),
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
                        .translate(_languages.values.elementAt(index)))
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
