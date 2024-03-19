class Review {
  final String id;
  final double score;
  final String comments;
  final String reviewerName;
  final DateTime? reviewDate;

  const Review({
    required this.id,
    required this.score,
    required this.comments,
    required this.reviewerName,
    this.reviewDate,
  });
}
