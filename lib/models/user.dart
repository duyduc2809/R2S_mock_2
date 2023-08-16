class User {
  String? userName;
  String? fullName;
  String? phoneNumber;
  String? email;
  String? password;
  List<String>? address;

  User(
      {this.userName,
        this.fullName,
        this.phoneNumber,
        this.email,
        this.password,
        this.address});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userName: json['userName'],
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      password: json['password'],
      address: json['address'],
    );
  }
}
