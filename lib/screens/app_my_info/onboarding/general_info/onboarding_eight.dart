import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_cv_app/const/dummy_data.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/models/language.dart';
import 'package:my_cv_app/models/my_info.dart';
import 'package:my_cv_app/services/app_localizations.dart';
import 'package:my_cv_app/widgets/common/question_button.dart';

class NannyOnboardingEightScreen extends StatefulWidget {
  final MyInfo nanny;
  final Function nextPage;
  NannyOnboardingEightScreen(this.nanny, this.nextPage);
  @override
  _NannyOnboardingEightScreenState createState() =>
      _NannyOnboardingEightScreenState();
}

class _NannyOnboardingEightScreenState
    extends State<NannyOnboardingEightScreen> {
  bool _isInit = true;
  List<Language> _languages = [];
  List<Language> _filteredLanguages = [];
  Language dropdownValue;

  Map<String, String> map = {};

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) {
      widget.nextPage();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      _languages = DUMMY_LANGUAGES;
      dropdownValue = _languages
                  .where((l) => l.id == widget.nanny.nativeLanguageId)
                  .toList()
                  .length >
              0
          ? _languages
              .where((l) => l.id == widget.nanny.nativeLanguageId)
              .toList()[0]
          : _languages[0];
    }
    _isInit = false;
    _filteredLanguages =
        _languages.where((element) => element.id != dropdownValue.id).toList();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Text(
                  AppLocalizations.of(context)
                      .translate('nanny_ob_eight_title'),
                  style: TextStyle(
                      color: ThemeColors.SECONDARY,
                      fontSize: ThemeSizes.TITLE,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                width: double.infinity,
                child: Text(
                  AppLocalizations.of(context)
                      .translate('nanny_ob_eight_subtitle'),
                  style: TextStyle(
                    color: ThemeColors.GRAY_TEXT,
                    fontSize: ThemeSizes.SUBTITLE,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                AppLocalizations.of(context).translate('nanny_ob_eight_native'),
                style: TextStyle(
                    color: ThemeColors.DARK_GRAY,
                    fontSize: ThemeSizes.PARAGRAPH),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              DropdownButton<Language>(
                style: TextStyle(
                    color: ThemeColors.SECONDARY,
                    fontWeight: FontWeight.bold,
                    fontSize: ThemeSizes.TITLE),
                underline: Container(),
                iconSize: 32,
                items: _languages.map<DropdownMenuItem<Language>>((value) {
                  print(value);
                  return DropdownMenuItem<Language>(
                    value: value,
                    child: Text(value.title),
                  );
                }).toList(),
                onChanged: (Language newValue) {
                  setState(() {
                    dropdownValue = newValue;
                    _filteredLanguages = _languages
                        .where((element) => element != newValue)
                        .toList();
                  });
                },
                value: dropdownValue,
              ),
              const SizedBox(height: 20),
              Text(
                AppLocalizations.of(context)
                    .translate('nanny_ob_eight_other_languages'),
                style: TextStyle(
                    color: ThemeColors.DARK_GRAY,
                    fontSize: ThemeSizes.PARAGRAPH),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                            width: double.infinity,
                            child: Text(
                              _filteredLanguages[index].title,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: ThemeSizes.SUBTITLE,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeColors.SECONDARY_DARK),
                            )),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: QuestionButton(
                                labelKey: 'basic',
                                isSelected: widget.nanny.otherLanguages == null
                                    ? false
                                    : widget.nanny.otherLanguages.containsKey(
                                            _filteredLanguages[index].id)
                                        ? widget.nanny.otherLanguages[
                                                    _filteredLanguages[index]
                                                        .id] ==
                                                'basic'
                                            ? true
                                            : false
                                        : false,
                                width: kIsWeb
                                    ? 150
                                    : MediaQuery.of(context).size.width * 0.28,
                                fontSize: 14,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: QuestionButton(
                                labelKey: 'intermediate',
                                isSelected: widget.nanny.otherLanguages == null
                                    ? false
                                    : widget.nanny.otherLanguages.containsKey(
                                            _filteredLanguages[index].id)
                                        ? widget.nanny.otherLanguages[
                                                    _filteredLanguages[index]
                                                        .id] ==
                                                'intermediate'
                                            ? true
                                            : false
                                        : false,
                                width: kIsWeb
                                    ? 150
                                    : MediaQuery.of(context).size.width * 0.28,
                                fontSize: 14,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: QuestionButton(
                                onPressed: () {},
                                labelKey: 'advanced',
                                isSelected: widget.nanny.otherLanguages == null
                                    ? false
                                    : widget.nanny.otherLanguages.containsKey(
                                            _filteredLanguages[index].id)
                                        ? widget.nanny.otherLanguages[
                                                    _filteredLanguages[index]
                                                        .id] ==
                                                'advanced'
                                            ? true
                                            : false
                                        : false,
                                width: kIsWeb
                                    ? 150
                                    : MediaQuery.of(context).size.width * 0.28,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                itemCount: _filteredLanguages.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
