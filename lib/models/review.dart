class Review {
  final String id;
  final double score;
  final String comments;
  final String reviewType;
  final String nannyId;
  final String familyId;
  final String serviceId;
  final DateTime reviewDate;

  const Review({
    this.id,
    this.score,
    this.comments,
    this.familyId,
    this.serviceId,
    this.nannyId,
    this.reviewType,
    this.reviewDate,
  });
}
