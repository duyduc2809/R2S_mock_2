import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mobile_store/models/review.dart';
import 'package:mobile_store/models/review_input.dart';

import '../models/api_user.dart';
import '../services/hive_helpers.dart';

class FetchReview {
  final String urlRead = "http://45.117.170.206:60/apis/review/";
  final String urlCreate = "http://45.117.170.206:60/apis/review/";
  final int statusCode200 = 200;
  final int statusCode201 = 201;
  final String bearerToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ2b3RpZW4xMjM0NUBnbWFpbC5jb20iLCJyb2xlcyI6W3siYXV0aG9yaXR5IjoiUm9sZV9DdXN0b21lciJ9XSwiaWF0IjoxNjkzNDA1NTE1LCJleHAiOjE2OTM0MjM1MTV9.U_gmyBP6Msm630hMY3bY7SXqMJjkzarh9W03jfI_D4k';

  //Get
  List<Review> parseReview(Response response) {
    final jsonMap = jsonDecode(utf8.decode(response.bodyBytes));
    final contents = jsonMap['contents'] as List<dynamic>;
    return contents.map<Review>((json) => Review.fromJson(json)).toList();
  }

  Future<List<Review>> getAllReview(int id) async {
    final uri = Uri.parse("$urlRead$id");
    final response = await http.get(uri);

    if (response.statusCode == statusCode200) {
      return parseReview(response);
    }
    throw Exception(
        "Failed to get Review, Status Code: ${response.statusCode}");
  }

  //Create
  Future<String?> createReview(ReviewInput review) async {
    final APIUser user = await HiveHelper.loadUserData();
    final uri = Uri.parse(urlCreate);
    final headers = {
      'Authorization': 'Bearer ${user.token}',
      'Content-Type': 'application/json'
    };
    final body = jsonEncode({
      "product_id": review.product_id.toString(),
      "comment": review.comment.toString(),
      "rating": review.rating.toString(),
      "status": review.status.toString()
    });
    final response = await http.post(uri, body: body, headers: headers);
    final jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
    print(jsonResponse);
    if (response.statusCode == statusCode201) {
      return null;
    } else {
      print(jsonResponse);
      return "Failed to create, Status Code: ${response.statusCode}";
    }
  }
}
