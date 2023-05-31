// To parse this JSON data, do
//
//     final multilistaddressModel = multilistaddressModelFromJson(jsonString);

import 'dart:convert';

MultilistaddressModel multilistaddressModelFromJson(String str) =>
    MultilistaddressModel.fromJson(json.decode(str));

String multilistaddressModelToJson(MultilistaddressModel data) =>
    json.encode(data.toJson());

class MultilistaddressModel {
  String status;
  String message;
  List<Datum> data;

  MultilistaddressModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory MultilistaddressModel.fromJson(Map<String, dynamic> json) =>
      MultilistaddressModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int addressId;
  String address;
  String street;
  String stateId;
  String cityId;
  String state;
  String city;
  String pincode;
  DateTime createdAt;

  Datum({
    required this.addressId,
    required this.address,
    required this.street,
    required this.stateId,
    required this.cityId,
    required this.state,
    required this.city,
    required this.pincode,
    required this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        addressId: json["address_id"],
        address: json["address"],
        street: json["street"],
        stateId: json["state_id"],
        cityId: json["city_id"],
        state: json["state"],
        city: json["city"],
        pincode: json["pincode"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "address_id": addressId,
        "address": address,
        "street": street,
        "state_id": stateId,
        "city_id": cityId,
        "state": state,
        "city": city,
        "pincode": pincode,
        "created_at": createdAt.toIso8601String(),
      };
}
