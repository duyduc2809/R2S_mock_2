class User {
  String? userName;
  String? fullName;
  String? phoneNumber;
  String? birthDay;
  int? gender;
  String? email;
  String? password;
  List<String>? address;

  User(
      {this.userName,
      this.fullName,
      this.phoneNumber,
      this.birthDay,
      this.gender,
      this.email,
      this.password,
      this.address});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userName: json['userName'],
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      birthDay: json['birthDay'],
      gender: json['gender'],
      email: json['email'],
      password: json['password'],
      address: json['address'],
    );
  }
}
