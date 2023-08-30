import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cart_product.dart';
import '../models/promotion.dart';

class FetchCartProduct {
  final String urlRead = "http://45.117.170.206:60/apis/order/user?no=0&limit";
  final int statusCode200 = 200;
  final String bearerToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ2b3RpZW4xMjM0NUBnbWFpbC5jb20iLCJyb2xlcyI6W3siYXV0aG9yaXR5IjoiUm9sZV9DdXN0b21lciJ9XSwiaWF0IjoxNjkyODU3NjIxLCJleHAiOjE2OTI4NzU2MjF9.PRSf9ymxJ_bBkFvBuO32jvIbjC1jIjx7xm88jn-oT7s";
  List<CartProduct> parseCartProduct(String response) {
    final jsonMap = jsonDecode(response);
    final contents = jsonMap['contents'] as List<dynamic>;

    List<CartProduct> products = contents.map((content) {
      return CartProduct(
        name: content['productOrderDTO']['name'],
        quantity: content['quantity'],
        imageUrl: content['productOrderDTO']['image'],
        price: content['productOrderDTO']['price'],
        color: content['productOrderDTO']['color'],
        memory: content['productOrderDTO']['memory'],
      );
    }).toList();
    return products;
  }

  double calculateTotal(List<CartProduct> products) {
    double total = 0.0;
    for (var product in products) {
      total += (product.price * product.quantity);
    }
    return total;
  }

  Future<List<CartProduct>> getCartProduct(int no) async {
    final uri = Uri.parse("$urlRead?no=$no&limit");
    final headers = {'Authorization': 'Bearer $bearerToken'};
    final response = await http.get(uri, headers: headers);

    if (response.statusCode == statusCode200) {
      return parseCartProduct(response.body);
    }
    throw Exception("Failed to get Promotion, Status Code: ${response.statusCode}");

  }
}



