// To parse this JSON data, do
//
//     final fillcitymodel = fillcitymodelFromJson(jsonString);

import 'dart:convert';

Fillcitymodel fillcitymodelFromJson(String str) =>
    Fillcitymodel.fromJson(json.decode(str));

String fillcitymodelToJson(Fillcitymodel data) => json.encode(data.toJson());

class Fillcitymodel {
  Fillcitymodel({
    this.status,
    this.city,
  });

  int? status;
  List<City>? city;

  factory Fillcitymodel.fromJson(Map<String, dynamic> json) => Fillcitymodel(
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
