class ReviewInput {
  final int product_id;
  final String comment;
  final int rating;
  final bool status;

  ReviewInput(
      {
        required this.product_id,
        required this.comment,
        required this.rating,
        required this.status});

  factory ReviewInput.fromJson(Map<String, dynamic> json) {
    return ReviewInput(
      product_id: json['product_id'],
      comment: json['comment'],
      rating: json['rating'],
      status: json['status'],
    );
  }
}
