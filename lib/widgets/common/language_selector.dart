import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/providers/nanny_data.dart';
import 'package:my_cv_app/services/app_localizations.dart';
import 'package:provider/provider.dart';

class LanguageSelector extends StatefulWidget {
  @override
  _LanguageSelectorState createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  String dropdownValue;
  bool _isInit = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      dropdownValue =
          Provider.of<MyInfoProvider>(context).currentLang.toUpperCase();
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.topRight,
      child: DropdownButton<String>(
        value: dropdownValue,
        style: TextStyle(
            color: ThemeColors.PRIMARY_TEXT, fontSize: ThemeSizes.PARAGRAPH),
        onChanged: (String newValue) async {
          print('loading langs');
          AppLocalizationsDelegate(overriddenLocale: Locale(newValue));
          setState(() {
            AppLocalizations.of(context).load(lang: newValue);
            dropdownValue = newValue;
            Provider.of<MyInfoProvider>(context, listen: false)
                .setCurrentLang(dropdownValue);
          });
        },
        items: <String>[
          'EN',
          'ES',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
