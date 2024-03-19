import 'package:flutter/material.dart';
import 'package:my_cv_app/const/theme.dart';
import 'package:my_cv_app/models/my_info.dart';
import 'package:my_cv_app/services/app_localizations.dart';

class ExperienceRow extends StatefulWidget {
  final String? imagePath;
  final String? textKey;
  final String? nannyKey;
  final MyInfo nanny;
  final int index;
  ExperienceRow({
    this.textKey,
    this.imagePath,
    this.nannyKey,
    required this.nanny,
    required this.index,
  });

  @override
  _ExperienceRowState createState() => _ExperienceRowState();
}

class _ExperienceRowState extends State<ExperienceRow> {
  final TextEditingController _expController = TextEditingController();
  Map<String, String> map = {};

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 700 * widget.index)).then((value) {
      _expController.text = widget.nanny.experiences == null
          ? ''
          : widget.nanny.experiences.containsKey(widget.nannyKey)
              ? widget.nanny.experiences[widget.nannyKey].toString()
              : '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.imagePath == null
              ? FlutterLogo(
                  size: 70,
                )
              : Image.asset(
                  widget.imagePath!,
                  height: 70,
                  width: 70,
                ),
          Text(
            widget.textKey != null
                ? AppLocalizations.of(context).translate(widget.textKey!) ?? ''
                : '',
            style: TextStyle(
                color: ThemeColors.PRIMARY,
                fontWeight: FontWeight.bold,
                fontSize: ThemeSizes.PARAGRAPH),
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: 50,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(ThemeSizes.BORDER_RADIUS),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _expController,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Muli',
                      fontWeight: FontWeight.bold,
                      color: ThemeColors.SECONDARY),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 10, bottom: 11, top: 11, right: 10),
                    fillColor: Colors.white,
                  ),
                  onChanged: (val) {
                    if (widget.nanny.experiences == null) {
                      map[widget.nannyKey ?? ''] = val;
                    } else {}
                    print('changed field');
                  },
                ),
              ),
              const SizedBox(width: 5),
              Text(
                AppLocalizations.of(context)
                        .translate('nanny_ob_seven_years') ??
                    '',
                style: TextStyle(color: ThemeColors.DARK_GRAY),
              )
            ],
          ),
        ],
      ),
    );
  }
}
