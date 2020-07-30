import 'package:flutter/material.dart';

class Skill {
  final String id;
  final String skill;
  final bool active;
  final double order;
  final bool isNannySelect;
  final String skillEs;

  const Skill(
      {@required this.id,
      @required this.skill,
      this.active = true,
      this.order,
      this.isNannySelect = true,
      this.skillEs});
}
