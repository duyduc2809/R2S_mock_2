// ignore_for_file: public_member_api_docs, sort_constructors_first
class Review {
  final String user_name;
  final int product_id;
  final String comment;
  final int rating;
  final bool status;

  Review({
    required this.user_name,
    required this.product_id,
    required this.comment,
    required this.rating,
    required this.status,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
        user_name: json['user_name'],
        product_id: json['product_id'],
        comment: json['comment'],
        rating: json['rating'],
        status: json['status']);
  }
}
