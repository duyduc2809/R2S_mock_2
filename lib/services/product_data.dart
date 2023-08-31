import 'dart:convert';
import 'package:http/http.dart';
import 'package:mobile_store/models/product/product.dart';
import 'package:http/http.dart' as http;

class ProductData {
  static const baseUrl = "http://45.117.170.206:60/apis/file/display/";
  final String urlRead = "http://45.117.170.206:60/apis/product/new";
  static const detailRead = "http://45.117.170.206:60/apis/product/detail/";
  final int statusCode200 = 200;

  List<Product> parseProducts(Response response) {
    final jsonMap = jsonDecode(utf8.decode(response.bodyBytes));
    return jsonMap.map<Product>((json) => Product.fromJson(json)).toList();
  }

  Future<List<Product>> getAllProducts() async {
    final uri = Uri.parse("$urlRead");

    final response = await http.get(uri);

    if (response.statusCode == statusCode200) {
      return parseProducts(response);
    }
    throw Exception(
        "Failed to get Products, Status Code: ${response.statusCode}");
  }

  Future<List<Product>> getImages() async {
    final uri = Uri.parse("$baseUrl");

    final response = await http.get(uri);

    if (response.statusCode == statusCode200) {
      return parseProducts(response);
    }
    throw Exception(
        "Failed to get Products, Status Code: ${response.statusCode}");    

  }

  Future<List<Product>> getProductDetail() async {
    final uri = Uri.parse("$detailRead");

    final response = await http.get(uri);

    if (response.statusCode == statusCode200) {
      return parseProducts(response);
    }
    throw Exception(
        "Failed to get Products, Status Code: ${response.statusCode}");    

  }
}
