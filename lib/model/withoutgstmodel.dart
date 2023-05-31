// To parse this JSON data, do
//
//     final withoutgstOrderModel = withoutgstOrderModelFromJson(jsonString);

import 'dart:convert';

WithoutgstOrderModel withoutgstOrderModelFromJson(String str) =>
    WithoutgstOrderModel.fromJson(json.decode(str));

String withoutgstOrderModelToJson(WithoutgstOrderModel data) =>
    json.encode(data.toJson());

class WithoutgstOrderModel {
  WithoutgstOrderModel({
    this.status,
    this.message,
    this.orderDetails,
    this.totalPrice,
  });

  String? status;
  String? message;
  List<OrderDetail>? orderDetails;
  String? totalPrice;

  factory WithoutgstOrderModel.fromJson(Map<String, dynamic> json) =>
      WithoutgstOrderModel(
        status: json["status"],
        message: json["message"],
        orderDetails: List<OrderDetail>.from(
            json["order_details"].map((x) => OrderDetail.fromJson(x))),
        totalPrice: json["total_price"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "order_details":
            List<dynamic>.from(orderDetails!.map((x) => x.toJson())),
        "total_price": totalPrice,
      };
}

class OrderDetail {
  OrderDetail({
    this.category,
    this.subcategory,
    this.material,
    this.materialType,
    this.quantity,
    this.perPrice,
    this.price,
  });

  String? category;
  String? subcategory;
  String? material;
  String? materialType;
  int? quantity;
  int? perPrice;
  int? price;

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        category: json["category"],
        subcategory: json["subcategory"],
        material: json["material"],
        materialType: json["material_type"],
        quantity: json["quantity"],
        perPrice: json["per_price"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "subcategory": subcategory,
        "material": material,
        "material_type": materialType,
        "quantity": quantity,
        "per_price": perPrice,
        "price": price,
      };
}
