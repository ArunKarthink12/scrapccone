// To parse this JSON data, do
//
//     final deleteaddressModel = deleteaddressModelFromJson(jsonString);

import 'dart:convert';

DeleteaddressModel deleteaddressModelFromJson(String str) =>
    DeleteaddressModel.fromJson(json.decode(str));

String deleteaddressModelToJson(DeleteaddressModel data) =>
    json.encode(data.toJson());

class DeleteaddressModel {
  String status;
  String message;

  DeleteaddressModel({
    required this.status,
    required this.message,
  });

  factory DeleteaddressModel.fromJson(Map<String, dynamic> json) =>
      DeleteaddressModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
