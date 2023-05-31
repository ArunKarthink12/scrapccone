// To parse this JSON data, do
//
//     final singleorderdataModel = singleorderdataModelFromJson(jsonString);

import 'dart:convert';

SingleorderdataModel singleorderdataModelFromJson(String str) =>
    SingleorderdataModel.fromJson(json.decode(str));

String singleorderdataModelToJson(SingleorderdataModel data) =>
    json.encode(data.toJson());

class SingleorderdataModel {
  String status;
  String message;
  Data data;
  String totalPrice;

  SingleorderdataModel({
    required this.status,
    required this.message,
    required this.data,
    required this.totalPrice,
  });

  factory SingleorderdataModel.fromJson(Map<String, dynamic> json) =>
      SingleorderdataModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        totalPrice: json["total_price"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
        "total_price": totalPrice,
      };
}

class Data {
  List<OrderDetail> orderDetails;

  Data({
    required this.orderDetails,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        orderDetails: List<OrderDetail>.from(
            json["order_details"].map((x) => OrderDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "order_details":
            List<dynamic>.from(orderDetails.map((x) => x.toJson())),
      };
}

class OrderDetail {
  String orderId;
  DateTime createdAt;
  UserDetails userDetails;
  String status;
  int totalPrice;
  String image;
  String orderCancel;
  List<Materialslist> materialslist;

  OrderDetail({
    required this.orderId,
    required this.createdAt,
    required this.userDetails,
    required this.status,
    required this.orderCancel,
    required this.totalPrice,
    required this.image,
    required this.materialslist,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        orderId: json["order_id"],
        createdAt: DateTime.parse(json["created_at"]),
        userDetails: UserDetails.fromJson(json["user_details"]),
        status: json["status"],
        orderCancel: json["order_cancel"],
        totalPrice: json["total_price"],
        image: json["image"],
        materialslist: List<Materialslist>.from(
            json["materialslist"].map((x) => Materialslist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "created_at": createdAt.toIso8601String(),
        "user_details": userDetails.toJson(),
        "status": status,
        "order_cancel": orderCancel,
        "total_price": totalPrice,
        "image": image,
        "materialslist":
            List<dynamic>.from(materialslist.map((x) => x.toJson())),
      };
}

class Materialslist {
  String category;
  String subcategory;
  String material;
  String materialType;
  int quantity;
  int perPrice;
  int price;

  Materialslist({
    required this.category,
    required this.subcategory,
    required this.material,
    required this.materialType,
    required this.quantity,
    required this.perPrice,
    required this.price,
  });

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
  String userName;
  String companyName;
  String emailId;
  String mobileNumber;
  dynamic gstNumber;
  String address;
  String street;
  String state;
  String city;
  String pincode;

  UserDetails({
    required this.userName,
    required this.companyName,
    required this.emailId,
    required this.mobileNumber,
    this.gstNumber,
    required this.address,
    required this.street,
    required this.state,
    required this.city,
    required this.pincode,
  });

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
