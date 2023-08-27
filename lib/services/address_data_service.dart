import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mobile_store/models/address.dart';

class AddressRepository {
  static const addressUrl = "http://45.117.170.206:60/apis/address";

  Future<List<Address>> getAllAddresses() async {
    final uri = Uri.parse(addressUrl);
    final response = await http.get(
      uri,
      // headers: {
      //   HttpHeaders.contentTypeHeader: "application/json",
      //   HttpHeaders.authorizationHeader:
      //       "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbkBnbWFpbC5jb20iLCJyb2xlcyI6W3siYXV0aG9yaXR5IjoiUm9sZV9BZG1pbiJ9XSwiaWF0IjoxNjkyNzU4NzA0LCJleHAiOjE2OTI3NzY3MDR9.uFJw2vWecAPR7CsCt1q6WlwSciYxxrvYz-GiXVGviAc"
      // }
    );
    if (response.statusCode == 200) {
      return parseAddress(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  List<Address> parseAddress(String response) {
    final parsedAddress = jsonDecode(response).cast<Map<String, dynamic>>();
    return parsedAddress
        .map<Address>((json) => Address.fromJson(json))
        .toList();
  }
}
