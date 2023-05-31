// To parse this JSON data, do
//
//     final fillDetailsModel = fillDetailsModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final fillDetailsModel = fillDetailsModelFromJson(jsonString);

import 'dart:convert';

FillDetailsModel fillDetailsModelFromJson(String str) =>
    FillDetailsModel.fromJson(json.decode(str));

String fillDetailsModelToJson(FillDetailsModel data) =>
    json.encode(data.toJson());

class FillDetailsModel {
  FillDetailsModel({
    required this.status,
    required this.orderId,
    required this.totalPrice,
    required this.message,
  });

  String status;
  String orderId;
  int totalPrice;
  String message;

  factory FillDetailsModel.fromJson(Map<String, dynamic> json) =>
      FillDetailsModel(
        status: json["status"],
        orderId: json["order_id"],
        totalPrice: json["total_price"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "order_id": orderId,
        "total_price": totalPrice,
        "message": message,
      };
}

// To parse this JSON data, do

//     final formfillingModel = formfillingModelFromJson(jsonString);

// import 'dart:convert';

// FormfillingModel formfillingModelFromJson(String str) =>
//     FormfillingModel.fromJson(json.decode(str));

// String formfillingModelToJson(FormfillingModel data) =>
//     json.encode(data.toJson());

// class FormfillingModel {
//   FormfillingModel({
//     this.status,
//     this.message,
//   });

//   String? status;
//   Message? message;

//   factory FormfillingModel.fromJson(Map<String, dynamic> json) =>
//       FormfillingModel(
//         status: json["status"],
//         message: Message.fromJson(json["message"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message!.toJson(),
//       };
// }

// class Message {
//   Message({
//     this.orderId,
//     this.amount,
//     this.userName,
//     this.mobileNumber,
//     this.emailId,
//     this.companyName,
//     this.address,
//     this.street,
//     this.gstnumber,
//     this.state,
//     this.city,
//     this.pincode,
//   });

//   List<String>? orderId;
//   List<String>? amount;
//   List<String>? userName;
//   List<String>? mobileNumber;
//   List<String>? gstnumber;
//   List<String>? emailId;
//   List<String>? companyName;
//   List<String>? address;
//   List<String>? street;
//   List<String>? state;
//   List<String>? city;
//   List<String>? pincode;

//   factory Message.fromJson(Map<String, dynamic> json) => Message(
//         orderId: List<String>.from(json["order_id"].map((x) => x)),
//         amount: List<String>.from(json["amount"].map((x) => x)),
//         userName: List<String>.from(json["userName"].map((x) => x)),
//         mobileNumber: List<String>.from(json["mobileNumber"].map((x) => x)),
//         emailId: List<String>.from(json["email_id"].map((x) => x)),
//         gstnumber: List<String>.from(json["email_id"].map((x) => x)),
//         companyName: List<String>.from(json["companyName"].map((x) => x)),
//         address: List<String>.from(json["address"].map((x) => x)),
//         street: List<String>.from(json["street"].map((x) => x)),
//         state: List<String>.from(json["state"].map((x) => x)),
//         city: List<String>.from(json["city"].map((x) => x)),
//         pincode: List<String>.from(json["pincode"].map((x) => x)),
//       );

//   Map<String, dynamic> toJson() => {
//         "order_id": List<dynamic>.from(orderId!.map((x) => x)),
//         "amount": List<dynamic>.from(amount!.map((x) => x)),
//         "userName": List<dynamic>.from(userName!.map((x) => x)),
//         "mobileNumber": List<dynamic>.from(mobileNumber!.map((x) => x)),
//         "email_id": List<dynamic>.from(emailId!.map((x) => x)),
//         "gstnumber": List<dynamic>.from(gstnumber!.map((x) => x)),
//         "companyName": List<dynamic>.from(companyName!.map((x) => x)),
//         "address": List<dynamic>.from(address!.map((x) => x)),
//         "street": List<dynamic>.from(street!.map((x) => x)),
//         "state": List<dynamic>.from(state!.map((x) => x)),
//         "city": List<dynamic>.from(city!.map((x) => x)),
//         "pincode": List<dynamic>.from(pincode!.map((x) => x)),
//       };
// }
