import 'dart:convert';

import 'package:http/http.dart' as http;

const String provinceApi = "https://provinces.open-api.vn/api/p";
const String districtApi = "https://provinces.open-api.vn/api/d";
const String wardApi = "https://provinces.open-api.vn/api/w";

String handleToReadableName(Map<String, dynamic> json) {
  List<String> rawList = json["codename"].split("_");
  List<String> formtedList =
      rawList.map((e) => "${e[0].toUpperCase()}${e.substring(1)}").toList();
  String readableName = formtedList.join(" ");
  return readableName;
}

class AddressDataRepository {
  List<String> provinceList = [];
  Map<String, List<String>> districts = {};
  Map<String, List<String>> wards = {};

  AddressDataRepository();

  Future<List<dynamic>> getData(String api, String type) async {
    final uri = Uri.parse(api);
    final response = await http.get(
      uri,
    );

    if (response.statusCode == 200) {
      return parseToList(response.body, type: type);
    } else {
      throw Exception('Failed to load data');
    }
  }

  List<dynamic> parseToList(String data, {required String type}) {
    final parsedList = jsonDecode(data).cast<Map<String, dynamic>>();
    switch (type.toLowerCase()) {
      case "province":
        {
          return parsedList
              .map<Province>((json) => Province.fromjson(json))
              .toList();
        }
      case "district":
        {
          return parsedList
              .map<District>((json) => District.fromJson(json))
              .toList();
        }

      case "ward":
        {
          return parsedList.map<Ward>((json) => Ward.fromJson(json)).toList();
        }
    }
    throw Exception("Failed to parse list");
  }

  Future<bool> setData() async {
    List<dynamic> provinceData = await getData(provinceApi, "province");
    provinceList =
        List.generate(provinceData.length, (index) => provinceData[index].name);

    //set data to districts
    List<dynamic> districtData = await getData(districtApi, "district");
    for (int i = 0; i < provinceData.length; i++) {
      String provinceName = provinceData[i].name;
      List<dynamic> districtsOfProvince = districtData
          .where((element) => element.provinceCode == provinceData[i].code)
          .toList();
      List<String> districtNames = List.generate(districtsOfProvince.length,
          (index) => districtsOfProvince[index].name);
      districts[provinceName] = districtNames;
    }

    //setData to ward
    List<dynamic> wardData = await getData(wardApi, "ward");
    for (int i = 0; i < districtData.length; i++) {
      String districtName = districtData[i].name;
      List<dynamic> wardOfDistrict = wardData
          .where((element) => element.districtCode == districtData[i].code)
          .toList();
      List<String> wardNames = List.generate(
          wardOfDistrict.length, (index) => wardOfDistrict[index].name);
      wards[districtName] = wardNames;
    }
    return true;
  }
}

class Province {
  String? name;
  int? code;

  Province({this.name, this.code});

  factory Province.fromjson(Map<String, dynamic> json) {
    return Province(
      name: handleToReadableName(json),
      code: json["code"],
    );
  }
}

class District {
  String? name;
  int? code;
  int? provinceCode;

  District({this.name, this.code, this.provinceCode});

  factory District.fromJson(Map<String, dynamic> json) {
    return District(
        name: handleToReadableName(json),
        code: json["code"],
        provinceCode: json["province_code"]);
  }
}

class Ward {
  String? name;
  int? code;
  int? districtCode;

  Ward({this.name, this.code, this.districtCode});

  factory Ward.fromJson(Map<String, dynamic> json) {
    return Ward(
        name: handleToReadableName(json),
        code: json["code"],
        districtCode: json["district_code"]);
  }
}
