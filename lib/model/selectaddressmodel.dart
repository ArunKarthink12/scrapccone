// // To parse this JSON data, do
// //
// //     final sellectaddressModel = sellectaddressModelFromJson(jsonString);

// import 'dart:convert';

// SellectaddressModel sellectaddressModelFromJson(String str) =>
//     SellectaddressModel.fromJson(json.decode(str));

// String sellectaddressModelToJson(SellectaddressModel data) =>
//     json.encode(data.toJson());

// class SellectaddressModel {
//   String status;
//   String message;
//   Data data;

//   SellectaddressModel({
//     required this.status,
//     required this.message,
//     required this.data,
//   });

//   factory SellectaddressModel.fromJson(Map<String, dynamic> json) =>
//       SellectaddressModel(
//         status: json["status"],
//         message: json["message"],
//         data: Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": data.toJson(),
//       };
// }

// class Data {
//   String address;
//   String street;
//   String stateId;
//   String cityId;
//   String state;
//   String city;
//   String pincode;
//   DateTime createdAt;

//   Data({
//     required this.address,
//     required this.street,
//     required this.stateId,
//     required this.cityId,
//     required this.state,
//     required this.city,
//     required this.pincode,
//     required this.createdAt,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         address: json["address"],
//         street: json["street"],
//         stateId: json["state_id"],
//         cityId: json["city_id"],
//         state: json["state"],
//         city: json["city"],
//         pincode: json["pincode"],
//         createdAt: DateTime.parse(json["created_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "address": address,
//         "street": street,
//         "state_id": stateId,
//         "city_id": cityId,
//         "state": state,
//         "city": city,
//         "pincode": pincode,
//         "created_at": createdAt.toIso8601String(),
//       };
// }
