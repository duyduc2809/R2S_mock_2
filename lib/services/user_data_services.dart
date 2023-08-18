import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_store/cubit/app_cubits.dart';

import '../models/user.dart';

class UserDataServices {
  AppCubits appCubits = AppCubits();
  static const urlCreate = 'http://45.117.170.206:60/apis/user/';
  static const urlLogin = 'http://45.117.170.206:60/apis/login';

  //create new user account
  static Future<bool> createUser(User user) async {
    final uri = Uri.parse(urlCreate);
    final body = jsonEncode({
      'fullName': user.fullName.toString(),
      'userName': user.userName.toString(),
      'email': user.email.toString(),
      'password': user.password.toString(),
    });

    final response = await http.post(
      uri,
      body: body,
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 201) {
      print('create successfully');
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return true;
    } else {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return false;
    }
  }

  //login user
  static Future<bool> loginUser(User user) async {
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
      return true;
    } else {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return false;
    }
  }
}
