class Address {
  final int? id;
  String? location;
  String? phoneReceiver;
  String? nameReceiver;
  bool? defaults;
  String? type;

  Address(
      {this.id,
      this.location,
      this.phoneReceiver,
      this.nameReceiver,
      this.defaults,
      this.type});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        id: json["id"],
        location: json["location"],
        phoneReceiver: json["phoneReceiver"],
        nameReceiver: json["nameReceiver"],
        defaults: json["defaults"]);
  }

  set setStatus(String chosenType) {
    type = chosenType;
  }

  set setLocation(String newLocation) {
    location = newLocation;
  }

  set setPhoneReceiver(String newPhone) {
    phoneReceiver = newPhone;
  }

  set setNameReceiver(String newName) {
    nameReceiver = newName;
  }

  set setDefaults(bool value) {
    defaults = value;
  }
}
