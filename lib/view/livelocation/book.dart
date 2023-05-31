// To parse this JSON data, do
//
//     final arealocationmodel = arealocationmodelFromJson(jsonString);

import 'dart:convert';

Arealocationmodel arealocationmodelFromJson(String str) =>
    Arealocationmodel.fromJson(json.decode(str));

String arealocationmodelToJson(Arealocationmodel data) =>
    json.encode(data.toJson());

class Arealocationmodel {
  Arealocationmodel({
    required this.status,
    required this.area,
  });

  int status;
  List<Area> area;

  factory Arealocationmodel.fromJson(Map<String, dynamic> json) =>
      Arealocationmodel(
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
  });

  int id;
  String city;
  String area;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        city: json["city"],
        area: json["area"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "city": city,
        "area": area,
      };
}
