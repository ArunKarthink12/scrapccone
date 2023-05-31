// To parse this JSON data, do
//
//     final citylocationmodel = citylocationmodelFromJson(jsonString);

import 'dart:convert';

Citylocationmodel citylocationmodelFromJson(String str) =>
    Citylocationmodel.fromJson(json.decode(str));

String citylocationmodelToJson(Citylocationmodel data) =>
    json.encode(data.toJson());

class Citylocationmodel {
  Citylocationmodel({
    required this.status,
    required this.city,
  });

  int status;
  List<City> city;

  factory Citylocationmodel.fromJson(Map<String, dynamic> json) =>
      Citylocationmodel(
        status: json["status"],
        city: List<City>.from(json["city"].map((x) => City.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "city": List<dynamic>.from(city.map((x) => x.toJson())),
      };
}

class City {
  City({
    required this.id,
    required this.city,
  });

  int id;
  String city;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "city": city,
      };
}
