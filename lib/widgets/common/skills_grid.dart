import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_cv_app/models/my_info.dart';
import 'package:my_cv_app/models/skill.dart';
import 'package:my_cv_app/widgets/common/question_button.dart';

class SkillsGrid extends StatefulWidget {
  final bool editMode;
  final List<Skill> allSkills;
  final MyInfo nanny;
  final Function nextPage;
  final bool start;
  SkillsGrid(
      {this.allSkills,
      this.nanny,
      this.editMode,
      this.nextPage,
      this.start = false});

  @override
  _SkillsGridState createState() => _SkillsGridState();
}

class _SkillsGridState extends State<SkillsGrid> {
  List<String> select = [];
  int _skillStep = 0;

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    if (widget.start) {
      _startInput();
    }
  }

  void _startInput() {
    print('selecting skills');
    if (select.length != widget.nanny.selectedSkills.length) {
      select.add(widget.nanny.selectedSkills[_skillStep].id);
      setState(() {});
      _skillStep += 1;
      if ((_skillStep % 6) == 0 && _skillStep != 0) {
        _scrollController.animateTo(300,
            duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
      }
      Future.delayed(Duration(milliseconds: 300)).then((value) {
        _startInput();
      });
    } else {
      Future.delayed(Duration(seconds: 1)).then((value) {
        widget.nextPage();
      });
    }
  }

  void selectSkill(Skill s) {
    setState(() {
      if (select == null) {
        select = [s.id];
      } else if (!select.contains(s)) {
        select.add(s.id);
      } else {
        select.remove(s.id);
      }
      print(select.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      controller: _scrollController,
      physics:
          widget.editMode ? ScrollPhysics() : NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      childAspectRatio: kIsWeb ? 6 / 1 : 4 / 1,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      crossAxisCount: 2,
      children: widget.editMode
          ? widget.allSkills
              .map((e) => InkWell(
                    onTap: () {},
                    child: QuestionButton(
                      labelKey: e.skill,
                      isSelected: select == null
                          ? false
                          : select.contains(e.id)
                              ? true
                              : false,
                    ),
                  ))
              .toList()
          : widget.nanny.selectedSkills
              .map(
                (e) => QuestionButton(
                  labelKey: e.skill,
                  isSelected: true,
                ),
              )
              .toList(),
    );
  }
}
