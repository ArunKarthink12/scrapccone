// To parse this JSON data, do
//
//     final createPasswordModel = createPasswordModelFromJson(jsonString);

import 'dart:convert';

CreatePasswordModel createPasswordModelFromJson(String str) =>
    CreatePasswordModel.fromJson(json.decode(str));

String createPasswordModelToJson(CreatePasswordModel data) =>
    json.encode(data.toJson());

class CreatePasswordModel {
  CreatePasswordModel({
    this.status,
    this.message,
  });

  String? status;
  String? message;

  factory CreatePasswordModel.fromJson(Map<String, dynamic> json) =>
      CreatePasswordModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
