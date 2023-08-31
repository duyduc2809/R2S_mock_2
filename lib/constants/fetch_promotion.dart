import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_store/services/hive_helpers.dart';
import '../models/promotion.dart';
import '../models/api_user.dart';
import '../services/hive_helpers.dart';

class FetchPromotion {
  final String urlRead = "http://45.117.170.206:60/apis/promotion";
  final int statusCode200 = 200;

  List<Promotion> parsePromotions(String response) {
    final jsonMap = jsonDecode(response);
    final contents = jsonMap['contents'] as List<dynamic>;
    return contents.map<Promotion>((json) => Promotion.fromJson(json)).toList();
  }

  Future<List<Promotion>> getAllPromotions(int no, int limit) async {
    final APIUser user = await HiveHelper.loadUserData();
    final uri = Uri.parse("$urlRead?no=$no&limit=$limit");
    final headers = {'Authorization': 'Bearer ${user.token}'};
    final response = await http.get(uri, headers: headers);

    if (response.statusCode == statusCode200) {
      return parsePromotions(response.body);
    }
    throw Exception(
        "Failed to get Promotion, Status Code: ${response.statusCode}");
  }
}
