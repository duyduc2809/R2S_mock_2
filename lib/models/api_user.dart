  import 'package:hive/hive.dart';

part 'api_user.g.dart';
@HiveType(typeId: 1)
class APIUser {
  @HiveField(0)
  String? token;
  @HiveField(1)
  String? type;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? role;
  @HiveField(4)
  int? idUser;
  @HiveField(5)
  String? message;

  APIUser(
      {this.token,
      this.type,
      this.email,
      this.role,
      this.idUser,
      this.message});

  factory APIUser.fromJson(Map<String, dynamic> json) {
    return APIUser(
      token: json['token'],
      type: json['type'],
      email: json['email'],
      role: json['role'],
      idUser: json['idUser'],
      message: json['message'],
    );
  }
}
