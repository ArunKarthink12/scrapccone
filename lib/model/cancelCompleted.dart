// To parse this JSON data, do
//
//     final cancelOrderModel = cancelOrderModelFromJson(jsonString);

import 'dart:convert';

CancelOrderModel cancelOrderModelFromJson(String str) =>
    CancelOrderModel.fromJson(json.decode(str));

String cancelOrderModelToJson(CancelOrderModel data) =>
    json.encode(data.toJson());

class CancelOrderModel {
  CancelOrderModel({
    this.status,
    this.message,
  });

  String? status;
  String? message;

  factory CancelOrderModel.fromJson(Map<String, dynamic> json) =>
      CancelOrderModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
