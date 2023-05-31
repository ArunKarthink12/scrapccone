// To parse this JSON data, do
//
//     final historyModel = historyModelFromJson(jsonString);

import 'dart:convert';

HistoryModel historyModelFromJson(String str) =>
    HistoryModel.fromJson(json.decode(str));

String historyModelToJson(HistoryModel data) => json.encode(data.toJson());

class HistoryModel {
  HistoryModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory HistoryModel.fromJson(Map<String, dynamic> json) => HistoryModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.orderDetails,
  });

  List<OrderDetail>? orderDetails;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        orderDetails: List<OrderDetail>.from(
            json["order_details"].map((x) => OrderDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "order_details":
            List<dynamic>.from(orderDetails!.map((x) => x.toJson())),
      };
}

class OrderDetail {
  OrderDetail({
    this.orderId,
    this.createdAt,
    this.userDetails,
    this.status,
    this.totalPrice,
    this.image,
    this.materialslist,
  });

  String? orderId;
  DateTime? createdAt;
  UserDetails? userDetails;
  String? status;
  int? totalPrice;
  String? image;
  List<Materialslist>? materialslist;

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        orderId: json["order_id"],
        createdAt: DateTime.parse(json["created_at"]),
        userDetails: UserDetails.fromJson(json["user_details"]),
        status: json["status"],
        totalPrice: json["total_price"],
        image: json["image"] ??
            "https://lhmetal.com/wp-content/uploads/2021/02/Scrap-Metal-Recycling.jpg",
        materialslist: List<Materialslist>.from(
            json["materialslist"].map((x) => Materialslist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "created_at": createdAt!.toIso8601String(),
        "user_details": userDetails!.toJson(),
        "status": status,
        "total_price": totalPrice,
        "image": image,
        "materialslist":
            List<dynamic>.from(materialslist!.map((x) => x.toJson())),
      };
}

class Materialslist {
  Materialslist({
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

  factory Materialslist.fromJson(Map<String, dynamic> json) => Materialslist(
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

class UserDetails {
  UserDetails({
    this.userName,
    this.companyName,
    this.emailId,
    this.mobileNumber,
    this.gstNumber,
    this.address,
    this.street,
    this.state,
    this.city,
    this.pincode,
  });

  String? userName;
  String? companyName;
  String? emailId;
  String? mobileNumber;
  dynamic gstNumber;
  String? address;
  String? street;
  String? state;
  String? city;
  String? pincode;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        userName: json["userName"],
        companyName: json["companyName"],
        emailId: json["email_id"],
        mobileNumber: json["mobileNumber"],
        gstNumber: json["gstNumber"],
        address: json["address"],
        street: json["street"],
        state: json["state"],
        city: json["city"],
        pincode: json["pincode"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "companyName": companyName,
        "email_id": emailId,
        "mobileNumber": mobileNumber,
        "gstNumber": gstNumber,
        "address": address,
        "street": street,
        "state": state,
        "city": city,
        "pincode": pincode,
      };
}
