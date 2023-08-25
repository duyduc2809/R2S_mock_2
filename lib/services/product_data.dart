import 'dart:convert';
import 'package:mobile_store/models/product.dart';
import 'package:http/http.dart' as http;



class ProductData {
  Future<List<Product>> getNewProducts() async {
    const url = "http://45.117.170.206:60/apis/product/new";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json as List<dynamic>;
    final products = results.map((e) {
      return Product.fromJson(e);
    }).toList();
    return products;
  }
}