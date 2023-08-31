import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_store/models/api_user.dart';
import 'package:mobile_store/models/order.dart';
import 'package:mobile_store/services/hive_helpers.dart';

class FetchOrder {
  static const orderUrl = 'http://45.117.170.206:60/apis/order/user?no=0&limit';
  static const baseUrl = "http://45.117.170.206:60/apis/file/display/";
  Future<List<Order>> fetchOrders() async {
    final APIUser user = await HiveHelper.loadUserData();
    final uri = Uri.parse(orderUrl);
    final response = await http.get(
      uri,
      headers: {'Authorization': 'Bearer ${user.token}'},
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      final List<Order> orders = json['contents'].map((e) {
        return Order.fromJson(e);
      }).toList();

      return orders;
    } else {
      throw Exception('An error occurred while fetching orders.');
    }
  }
}
