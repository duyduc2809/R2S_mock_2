import 'dart:convert';
import 'package:mobile_store/models/product.dart';
import 'package:http/http.dart' as http;

class ProductData {
  final String urlRead = "http://45.117.170.206:60/apis/product/new";
  final int statusCode200 = 200;

  List<Product> parseProducts(String response) {
    final jsonMap = jsonDecode(response);
    return jsonMap.map<Product>((json) => Product.fromJson(json)).toList();
  }

  Future<List<Product>> getAllProducts() async {
    final uri = Uri.parse("$urlRead");

    final response = await http.get(uri);

    if (response.statusCode == statusCode200) {
      return parseProducts(response.body);
    }
    throw Exception(
        "Failed to get Products, Status Code: ${response.statusCode}");
  }
}
