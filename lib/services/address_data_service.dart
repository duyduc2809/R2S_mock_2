import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mobile_store/models/address.dart';
import 'package:mobile_store/models/api_user.dart';
import 'package:mobile_store/services/hive_helpers.dart';
import 'package:mobile_store/services/user_infor_data.dart';

class AddressRepository {
  static const urlGetUserByID = 'http://45.117.170.206:60/apis/user/';

  static const addressUrl = "http://45.117.170.206:60/apis/address";
  final UserRepository _userRepository = UserRepository();

  Future<List<Address>> getAllAddresses() async {
    final uri = Uri.parse(addressUrl);
    final APIUser user = await HiveHelper.loadUserData();
    final response = await http.get(
      uri,
      headers: {'Authorization': 'Bearer ${user.token}'},
    );
    if (response.statusCode == 200) {
      List json = jsonDecode(response.body);
      final result = json.map((e) => Address.fromJson(e)).toList();
      return result;
    } else {
      throw Exception('Failed to load data');
    }
  }

  List<Address> _parseJsonList(String body) {
    final parsedList = jsonDecode(body).cast<Map<String, dynamic>>();
    return parsedList.map<Address>((json) => Address.fromJson(json)).toList();
  }

  Future<Address> createAddress(Address address) async {
    final APIUser user = await HiveHelper.loadUserData();
    final url = '$urlGetUserByID${user.idUser}';

    final uri = Uri.parse(addressUrl);

    final body = jsonEncode({
      "location": address.location,
      "type": address.type,
      "phoneReceiver": address.phoneReceiver,
      "nameReceiver": address.nameReceiver,
    });

    final response = await http.post(uri, body: body, headers: {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.authorizationHeader: "Bearer ${user.token}",
    });

    if (response.statusCode == 201) {
      return Address.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.body);
    }
  }

  Future<void> deleteAddress(String id) async {
    final url = "$addressUrl/$id";
    final APIUser user = await HiveHelper.loadUserData();
    final uri = Uri.parse(url);

    final response = await http.delete(uri,
        headers: {HttpHeaders.authorizationHeader: "Bearer ${user.token}"});
    print(response.statusCode);

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception("Failed to delete an address");
    }
  }

  Future<Address> updateAddress(Address updatedAddress) async {
    final url = "$addressUrl/update-address/${updatedAddress.id}";

    final APIUser user = await HiveHelper.loadUserData();
    final uri = Uri.parse(url);

    final body = jsonEncode({
      "location": updatedAddress.location,
      "phoneReceiver": 012345678,
      "nameReceiver": updatedAddress.nameReceiver,
      "defaults": updatedAddress.defaults
    });

    final response = await http.put(uri, body: body, headers: {
      HttpHeaders.authorizationHeader: "Bearer ${user.token}",
      HttpHeaders.contentTypeHeader: "application/json",
    });

    print(response.statusCode);
    if (response.statusCode == 200) {
      return Address.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update address");
    }
  }

  Future<Address> getAddressById(Address address) async {
    final url = "$addressUrl/${address.id}";
    final APIUser user = await HiveHelper.loadUserData();
    final uri = Uri.parse(url);

    final response = await http.get(uri,
        headers: {HttpHeaders.authorizationHeader: "Bearer ${user.token}"});

    if (response.statusCode == 200) {
      return Address.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to get an address");
    }
  }
}
