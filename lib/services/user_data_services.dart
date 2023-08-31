import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_store/cubit/app_cubit_states.dart';
import 'package:mobile_store/cubit/app_cubits.dart';
import 'package:mobile_store/models/api_user.dart';
import 'package:mobile_store/services/hive_helpers.dart';

import '../models/user.dart';

class UserDataServices {
  static const urlGetUserByID = 'http://45.117.170.206:60/apis/user/';
  static const urlCreate = 'http://45.117.170.206:60/apis/user/';
  static const urlLogin = 'http://45.117.170.206:60/apis/login';
  static const urlChangePasswordByToken =
      'http://45.117.170.206:60/apis/user/change-password-by-token';
  static const urlForgotPassword =
      'http://45.117.170.206:60/apis/mail/forgot-password/';
  static const urlChangePasswordByOTP =
      'http://45.117.170.206:60/apis/user/change-password-by-otp/';
  static const urlActiveOtp =
      'http://45.117.170.206:60/apis/user/active-otp?activeOTP=';
  static const urlActiveUser =
      'http://45.117.170.206:60/apis/mail/active-user?email=';
  static const urlUpdateUser = 'http://45.117.170.206:60/apis/user/';

  //create new user account
  static Future<String?> createUser(User user) async {
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
    final jsonResponse = json.decode(response.body);
    if (response.statusCode == 201) {
      UserDataServices.sendActiveUser(user.email);
      print('create successfully');
      print(jsonResponse);
      return null;
    } else {
      print(jsonResponse);
      return jsonResponse['message'] ?? jsonResponse['error'];
    }
  }

  static Future<String?> updateUser(User user, BuildContext context) async {
    final APIUser apiUser = await HiveHelper.loadUserData();
    final uri = Uri.parse('$urlUpdateUser${apiUser.idUser}');
    final body = jsonEncode({
      "email": user.email.toString(),
      "fullName": user.fullName.toString(),
      "gender": user.gender ?? 1,
      "birthDay": user.birthDay.toString(),
      "id": apiUser.idUser,
      "authProvider": "null",
      "roleDTO": {"id": 2, "name": "Role_Customer"},
      "statusDTO": true,
      "lockStatusDTO": false
    });

    final response = await http.put(
      uri,
      body: body,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${apiUser.token}'
      },
    );
    final jsonResponse = json.decode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      print(jsonResponse);
      return null;
    } else {
      print(jsonResponse);
      return jsonResponse['message'] ?? jsonResponse['error'];
    }
  }

  //login user
  static Future<String?> loginUser(User user, bool rememberMe) async {
    final uri = Uri.parse(urlLogin);
    late final jsonResponse;
    final body = json.encode({'email': user.email, 'password': user.password});

    final response = await http.post(
      uri,
      body: body,
      headers: {'Content-Type': 'application/json'},
    );

    jsonResponse = json.decode(response.body);
    if (response.statusCode == 201) {
      print('login successfully');
      print(jsonResponse['messsage']);

      final apiUser = APIUser.fromJson(jsonResponse);
      HiveHelper.saveData(apiUser, rememberMe);
      print(jsonResponse);

      return null;
    } else {
      return jsonResponse['message'];
    }
  }

  //(hàm được gọi từ hàm login của AppCubits, dùng để lấy về thông tin của user đã đăng nhập)
  static Future<User> getUser() async {
    final APIUser user = await HiveHelper.loadUserData();
    final url = '$urlGetUserByID${user.idUser}';
    final uri = Uri.parse(url);

    final response = await http.get(
      uri,
      headers: {'Authorization': 'Bearer ${user.token}'},
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('getuser successfully');
      return User.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      print('get failed');
      throw Exception();
    }
  }

  static Future<String?> sendForgotEmail(String? value) async {
    const url = urlForgotPassword;
    final uri = Uri.parse('$url$value');

    final response = await http.get(
      uri,
      // headers: {'Content-Type': 'application/json'},
      // headers: {'Authorization': 'Bearer ${user.token}'},
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      return null;
    } else {
      final Map<String, dynamic> responseData = json.decode(response.body);
      print(responseData);
      return responseData['message'] ?? responseData['error'];
    }
  }

  static Future<String?> sendNewPasswordByOTP(
      String? otp, String? newPassword) async {
    const url = urlChangePasswordByOTP;
    final uri = Uri.parse(url);
    final body = jsonEncode(
        {'otp': otp.toString(), 'newPassword': newPassword.toString()});
    final response = await http.post(
      uri,
      body: body,
      headers: {'Content-Type': 'application/json'},
    );
    final Map<String, dynamic> responseData = json.decode(response.body);
    print(responseData);
    if (response.statusCode == 200) {
      return null;
    } else {
      return responseData['errors'];
    }
  }

  static Future<String?> sendActiveOTP(String? otp) async {
    const url = urlActiveOtp;
    final uri = Uri.parse('$url$otp');

    final response = await http.get(
      uri,
    );
    if (response.statusCode == 200) {
      return null;
    } else {
      return "Wrong OTP";
    }
  }

  static Future<String?> sendActiveUser(String? email) async {
    const url = urlActiveUser;
    final uri = Uri.parse('$url$email');

    final response = await http.get(
      uri,
    );
    final Map<String, dynamic> responseData = json.decode(response.body);
    print(responseData);
    if (response.statusCode == 200) {
      return null;
    } else {
      return "Wrong OTP";
    }
  }

  static Future<String?> changePasswordByToken(
      String oldPassword, String newPassword) async {
    final APIUser user = await HiveHelper.loadUserData();
    final uri = Uri.parse(urlChangePasswordByToken);
    late final jsonResponse;
    final body = jsonEncode({
      'newPassword': newPassword.toString(),
      'oldPassword': oldPassword.toString()
    });
    final response = await http.put(
      uri,
      body: body,
      headers: {
        'Authorization': 'Bearer ${user.token}',
        'Content-Type': 'application/json'
      },
    );

    jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      print(jsonResponse);
      return null;
    } else {
      print(jsonResponse);
      return 'Failed';
    }
  }
}
