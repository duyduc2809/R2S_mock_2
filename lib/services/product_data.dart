import 'dart:convert';

import 'package:mobile_store/models/product.dart';
import 'package:http/http.dart' as http;


class ProductData {
  String baseUrl = "http://45.117.170.206:60/apis/product";
  Future<List<Product>> getProduct() async {
    var apiUrl = '/show-product/1?no=0&limit=2';
    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));
    try {
      if(res.statusCode == 200) {
        List<dynamic> list  = json.decode(res.body);
        print(list);
        return list.map((e) => Product.fromJson(e)).toList();
      } else {
      return <Product>[];

      }
    }catch(e) {
      print(e);
      return <Product>[];
    }
  }
}