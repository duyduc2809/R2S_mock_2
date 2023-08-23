class Address {
  final int? id;
  final String? location;
  final String? phoneReceiver;
  final String? nameReceiver;
  final bool? defaults;

  Address(
      {this.id,
      this.location,
      this.phoneReceiver,
      this.nameReceiver,
      this.defaults});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        id: json["id"],
        location: json["location"],
        phoneReceiver: json["phoneReceiver"],
        nameReceiver: json["nameReceiver"],
        defaults: json["defaults"]);
  }
}
