import 'package:flutter/foundation.dart';

class Language {
  final String id;
  final String title;
  final bool active;
  final double order;
  final List<dynamic> levels;
  final String lanES;

  static const List<String> _levels = ['basic', 'intermediate','advanced'];

  const Language({@required this.id, @required this.title, this.active, this.order, this.levels=_levels, this.lanES});
}