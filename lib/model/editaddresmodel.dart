// To parse this JSON data, do
//
//     final editaddressModel = editaddressModelFromJson(jsonString);

import 'dart:convert';

EditaddressModel editaddressModelFromJson(String str) =>
    EditaddressModel.fromJson(json.decode(str));

String editaddressModelToJson(EditaddressModel data) =>
    json.encode(data.toJson());

class EditaddressModel {
  String status;
  String message;

  EditaddressModel({
    required this.status,
    required this.message,
  });

  factory EditaddressModel.fromJson(Map<String, dynamic> json) =>
      EditaddressModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
