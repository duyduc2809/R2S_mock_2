import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mobile_store/models/address.dart';

class AddressRepository {
  static const addressUrl = "http://45.117.170.206:60/apis/address";

  Future<List<Address>> getAllAddresses() async {
    final uri = Uri.parse(addressUrl);
    final response = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader:
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ2b3RpZW4xMjM0NUBnbWFpbC5jb20iLCJyb2xlcyI6W3siYXV0aG9yaXR5IjoiUm9sZV9DdXN0b21lciJ9XSwiaWF0IjoxNjkzMDU0NjI1LCJleHAiOjE2OTMwNzI2MjV9.kCFU2sNMYI_NgMjAKLtL1Qc1VO6u_YT3N2n4vQdD6Mo"
    });
    if (response.statusCode == 200) {
      return _parseJsonList(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  List<Address> _parseJsonList(String body) {
    final parsedList = jsonDecode(body).cast<Map<String, dynamic>>();
    return parsedList.map<Address>((json) => Address.fromJson(json)).toList();
  }

  Future<Address> createAddress(Address address) async {
    final uri = Uri.parse(addressUrl);
    final body = {
      "location": address.location,
      "phoneReceiver": address.phoneReceiver,
      "nameReceiver": address.nameReceiver,
      "defaults": address.defaults
    };

    final response = await http.post(uri, body: body, headers: {
      HttpHeaders.authorizationHeader:
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ2b3RpZW4xMjM0NUBnbWFpbC5jb20iLCJyb2xlcyI6W3siYXV0aG9yaXR5IjoiUm9sZV9DdXN0b21lciJ9XSwiaWF0IjoxNjkzMDU0NjI1LCJleHAiOjE2OTMwNzI2MjV9.kCFU2sNMYI_NgMjAKLtL1Qc1VO6u_YT3N2n4vQdD6Mo"
    });

    if (response.statusCode == 201) {
      return Address.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to add a new address");
    }
  }
}
