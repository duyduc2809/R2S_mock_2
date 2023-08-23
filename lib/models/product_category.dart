// ignore_for_file: public_member_api_docs, sort_constructors_first
class Category {
  final int id;
  final String name;
  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(id: json["id"], name: json["name"]);
  }
}
