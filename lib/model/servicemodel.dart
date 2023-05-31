// To parse this JSON data, do
//
//     final servicemodel = servicemodelFromJson(jsonString);

import 'dart:convert';

Servicemodel servicemodelFromJson(String str) =>
    Servicemodel.fromJson(json.decode(str));

String servicemodelToJson(Servicemodel data) => json.encode(data.toJson());

class Servicemodel {
  Servicemodel({
    required this.status,
    required this.area,
  });

  int status;
  List<Area> area;

  factory Servicemodel.fromJson(Map<String, dynamic> json) => Servicemodel(
        status: json["status"],
        area: List<Area>.from(json["area"].map((x) => Area.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "area": List<dynamic>.from(area.map((x) => x.toJson())),
      };
}

class Area {
  Area({
    required this.id,
    required this.city,
    required this.area,
    required this.service,
  });

  int id;
  String city;
  String area;
  String service;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        city: json["city"],
        area: json["area"],
        service: json["service"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "city": city,
        "area": area,
        "service": service,
      };
}
