import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class UserDataServices {
  static const urlCreate = 'http://45.117.170.206:60/apis/user/';
  static const urlLogin = 'http://45.117.170.206:60/apis/login';

  static Future<void> createUser(User user) async {
    final uri = Uri.parse(urlCreate);
    final body = {
      'userName': user.userName,
      'email': user.email,
      'gender': 1,
      'birthDay': 'null',
      'password': user.password
    };

    final response = await http.post(uri, body: body);
    if (response.statusCode == 201) {
      print('create successfully');
    } else {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
    }
  }

  static Future<void> loginUser(User user) async {
    final uri = Uri.parse(urlLogin);
    print(user.email);
    print(user.password);
    final body = json.encode({'email': user.email, 'password': user.password});

    final response = await http.post(
      uri,
      body: body,
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 201) {
      print('login successfully');
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
    } else {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
    }
  }
}
