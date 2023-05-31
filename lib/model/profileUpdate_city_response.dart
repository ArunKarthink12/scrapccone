// To parse this JSON data, do
//
//     final profileUpdatCityModel = profileUpdatCityModelFromJson(jsonString);

import 'dart:convert';

ProfileUpdatCityModel profileUpdatCityModelFromJson(String str) =>
    ProfileUpdatCityModel.fromJson(json.decode(str));

String profileUpdatCityModelToJson(ProfileUpdatCityModel data) =>
    json.encode(data.toJson());

class ProfileUpdatCityModel {
  ProfileUpdatCityModel({
    this.status,
    this.city,
  });

  int? status;
  List<City>? city;

  factory ProfileUpdatCityModel.fromJson(Map<String, dynamic> json) =>
      ProfileUpdatCityModel(
        status: json["status"],
        city: List<City>.from(json["city"].map((x) => City.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "city": List<dynamic>.from(city!.map((x) => x.toJson())),
      };
}

class City {
  City({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
