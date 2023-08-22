import 'dart:convert';
import 'package:mobile_store/models/product.dart';
import 'package:http/http.dart' as http;


class ProductData {
  String baseUrl = "http://45.117.170.206:60/apis/product";
  final int statusCode200 = 200;
  List<Product> parseProducts(String response) {
    final jsonMap = jsonDecode(response);
    final contents = jsonMap['contents'] as List<dynamic>;
    return contents.map<Product>((json) => Product.fromJson(json)).toList();
  }

  Future<List<Product>> getAllProduct(int no, int limit) async {
    final uri = Uri.parse("$baseUrl/show-product/1?no=$no&limit=$limit");
    final response = await http.get(uri);

    if(response.statusCode == statusCode200) {
      return parseProducts(response.body);
    }
    throw Exception("Failed to get Product, Status Code: ${response.statusCode}");
  }
}