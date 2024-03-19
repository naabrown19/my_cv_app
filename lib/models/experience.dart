class Experience {
  final String id;
  final String descriptionKey;
  final String imagePath;
  final bool? active;
  final double? order;
  final String profileNameKey;

  const Experience({
    required this.id,
    required this.descriptionKey,
    required this.profileNameKey,
    required this.imagePath,
    this.active,
    this.order,
  });
}
