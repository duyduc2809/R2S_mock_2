class Review {
  final int id;
  final String user_name;
  final int product_id;
  final String comment;
  final int rating;
  final bool status;

  Review(
      {required this.id,
        required this.user_name,
        required this.product_id,
        required this.comment,
        required this.rating,
        required this.status});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        id: json['id'],
        user_name: json['user_name'],
        product_id: json['product_id'],
        comment: json['comment'],
        rating: json['rating'],
        status: json['status'],
       );
  }
}
