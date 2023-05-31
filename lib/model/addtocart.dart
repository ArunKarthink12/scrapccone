// To parse this JSON data, do
//
//     final addToCartModel = addToCartModelFromJson(jsonString);

import 'dart:convert';

AddToCartModel addToCartModelFromJson(String str) =>
    AddToCartModel.fromJson(json.decode(str));

String addToCartModelToJson(AddToCartModel data) => json.encode(data.toJson());

class AddToCartModel {
  AddToCartModel({
    this.status,
    this.message,
    this.orderId,
  });

  String? status;
  String? message;
  int? orderId;

  factory AddToCartModel.fromJson(Map<String, dynamic> json) => AddToCartModel(
        status: json["status"],
        message: json["message"],
        orderId: json["order_id"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "order_id": orderId,
      };
}
