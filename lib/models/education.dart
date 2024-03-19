class Education {
  final String id;
  final String year;
  final String title;
  final String institute;
  final DateTime? dateCreated;
  final List<EducationGroup> groups;

  const Education(
      {required this.id,
      required this.title,
      required this.institute,
      required this.year,
      this.dateCreated,
      this.groups = const []});
}

class EducationGroup {
  final String id;
  final String title;
  final bool? active;
  final double? order;

  const EducationGroup({
    required this.id,
    required this.title,
    this.active,
    this.order,
  });
}
