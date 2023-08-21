import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/promotion.dart';

class FetchPromotion {
  final String urlRead = "http://45.117.170.206:60/apis/promotion";
  final int statusCode200 = 200;
  final String bearerToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ2b3RpZW4xMjM0NUBnbWFpbC5jb20iLCJyb2xlcyI6W3siYXV0aG9yaXR5IjoiUm9sZV9DdXN0b21lciJ9XSwiaWF0IjoxNjkyNjIyMDIyLCJleHAiOjE2OTI2NDAwMjJ9.HACqVd9cT6zYY_I-Z32eNqzrAMSuJQAfitxGeabzCfs";

  List<Promotion> parsePromotions(String response) {
    final jsonMap = jsonDecode(response);
    final contents = jsonMap['contents'] as List<dynamic>;
    return contents.map<Promotion>((json) => Promotion.fromJson(json)).toList();
  }

  Future<List<Promotion>> getAllPromotions(int no, int limit) async {
    final uri = Uri.parse("$urlRead?no=$no&limit=$limit");
    final headers = {'Authorization': 'Bearer $bearerToken'};
    final response = await http.get(uri, headers: headers);

    if (response.statusCode == statusCode200) {
      return parsePromotions(response.body);
    }
    throw Exception("Failed to get Promotion, Status Code: ${response.statusCode}");

  }
}



