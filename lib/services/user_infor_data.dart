import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const String APIURL = "http://45.117.170.206:60/apis";

class UserRepository {
  final _storage = const FlutterSecureStorage();
  Future<int> login(String username, String password) async {
    final body = jsonEncode({
      "email": username,
      "password": password,
    });
    const url = "$APIURL/login/";
    final uri = Uri.parse(url);
    final response = await http
        .post(uri, body: body, headers: {"Content-Type": "application/json"});
    if (response.statusCode == 201) {
      var data = jsonDecode(response.body);
      print(data);
      await saveUserInfo(data['token'], username, data['idUser']);
    }

    return response.statusCode;
  }

  Future<int> register(String email, String password, String fullname) async {
    final body = jsonEncode({
      "email": email,
      "password": password,
      "fullName": fullname,
      "gender": "0",
      "birthDay": "20-03-2003",
      "authProvider": "null"
    });

    const url = "$APIURL/user/";
    final uri = Uri.parse(url);
    final response = await http
        .post(uri, body: body, headers: {"Content-Type": "application/json"});
    print(response.body);
    if (response.statusCode == 201) {
      await activeUser(email);
    }
    return response.statusCode;
  }

  Future<int> sendEmail(String? email) async {
    final url = "$APIURL/mail/forgot-password/$email";
    final uri = Uri.parse(url);
    final response =
        await get(uri, headers: {"Content-Type": "application/json"});
    print(response.body);
    return response.statusCode;
  }

  Future<int> otpActive(String? otp) async {
    final url = "$APIURL/user/active-otp?activeOTP=$otp";
    final uri = Uri.parse(url);
    final response =
        await get(uri, headers: {"Content-Type": "application/json"});
    print(response.body);
    return response.statusCode;
  }

  Future<int> resetPassword(String otp, String password) async {
    final body = jsonEncode({
      "otp": otp,
      "newPassword": password,
    });
    const url = "$APIURL/user/change-password-by-otp/";
    final uri = Uri.parse(url);
    final response = await http
        .post(uri, body: body, headers: {"Content-Type": "application/json"});
    print(response.body);
    return response.statusCode;
  }

  Future<int> activeUser(String? email) async {
    final url = "$APIURL/mail/active-user?email=$email";
    final uri = Uri.parse(url);
    final response =
        await get(uri, headers: {"Content-Type": "application/json"});
    print(response.body);
    return response.statusCode;
  }

  saveUserInfo(token, username, idUser) async {
    await _storage.write(
      key: "token",
      value: token,
    );
    await _storage.write(
      key: "username",
      value: username,
    );
    await _storage.write(
      key: "idUser",
      value: idUser.toString(),
    );
  }

  //added by Nghia
  saveUserPhoneNumber(String number) async {
    await _storage.write(key: "phoneNumber", value: number);
  }

  Future<String?> getUserPhoneNumber() async {
    String? result = await _storage.read(key: "phoneNumber");
    return result;
  }

  void logout() async {
    await _storage.delete(
      key: "username",
    );
    await _storage.delete(key: "token");
    await _storage.delete(key: "idUser");
  }

  getToken() async {
    String? val = await _storage.read(key: "token");
    return val.toString();
  }

  Future<String> getUsername() async {
    String? val = await _storage.read(key: "username");
    return val.toString();
  }

  getIdUser() async {
    String? val = await _storage.read(key: "idUser");
    return val.toString();
  }

  //added by Nghia
  Future<Map<String, dynamic>> getUserById(String id) async {
    final url = "$APIURL/user/$id";
    final uri = Uri.parse(url);
    final userToken = await getToken();
    final response = await http.get(uri, headers: {
      HttpHeaders.authorizationHeader: "Bearer $userToken",
    });
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to find user");
    }
  }
}
