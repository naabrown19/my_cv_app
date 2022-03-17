import 'package:flutter/material.dart';
import 'package:my_cv_app/const/dummy_data.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/models/my_info.dart';
import 'package:my_cv_app/models/skill.dart';
import 'package:my_cv_app/services/app_localizations.dart';
import 'package:my_cv_app/widgets/common/skills_grid.dart';

import 'package:flutter/foundation.dart' show kIsWeb;

class NannyOnboardingSixScreen extends StatefulWidget {
  final MyInfo nanny;
  final Function nextPage;
  NannyOnboardingSixScreen(this.nanny, this.nextPage);
  @override
  _NannyOnboardingSixScreenState createState() =>
      _NannyOnboardingSixScreenState();
}

class _NannyOnboardingSixScreenState extends State<NannyOnboardingSixScreen> {
  bool _isInit = true;
  final _descController = TextEditingController();
  List<Skill> _skills = DUMMY_SKILLS;
  bool _startSelecting = false;

  String _description;
  int _descriptionStep = 0;

  @override
  void initState() {
    super.initState();
  }

  void _startInput() {
    if (_descController.text != _description) {
      setState(() {
        _descController.text = _description.substring(0, _descriptionStep);
      });
      _descriptionStep += 1;
      Future.delayed(Duration(milliseconds: 70)).then((value) {
        _startInput();
      });
    }

    setState(() {
      _startSelecting = true;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      _skills = DUMMY_SKILLS;
      _description =
          AppLocalizations.of(context).translate(widget.nanny.description);
      _startInput();
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Text(
                AppLocalizations.of(context).translate('nanny_ob_six_title'),
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
                AppLocalizations.of(context).translate('nanny_ob_six_subtitle'),
                style: TextStyle(
                  color: ThemeColors.GRAY_TEXT,
                  fontSize: ThemeSizes.SUBTITLE,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(ThemeSizes.BORDER_RADIUS)),
              height: kIsWeb ? 100 : MediaQuery.of(context).size.height * 0.25,
              child: TextField(
                controller: _descController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  fillColor: Colors.white,
                  hintText:
                      AppLocalizations.of(context).translate('description'),
                  labelText: AppLocalizations.of(context)
                      .translate('nanny_ob_six_description'),
                ),
                onChanged: (val) {},
              ),
            ),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)
                  .translate('nanny_ob_six_select_skills'),
              style: TextStyle(
                  color: ThemeColors.DARK_GRAY, fontSize: ThemeSizes.PARAGRAPH),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SkillsGrid(
                  allSkills: _skills,
                  nanny: widget.nanny,
                  editMode: true,
                  nextPage: widget.nextPage,
                  start: _startSelecting),
            )
          ],
        ),
      ),
    );
  }
}
