// To parse this JSON data, do
//
//     final profileUpdateModelClass = profileUpdateModelClassFromJson(jsonString);

import 'dart:convert';

ProfileUpdateModelClass profileUpdateModelClassFromJson(String str) =>
    ProfileUpdateModelClass.fromJson(json.decode(str));

String profileUpdateModelClassToJson(ProfileUpdateModelClass data) =>
    json.encode(data.toJson());

class ProfileUpdateModelClass {
  ProfileUpdateModelClass({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory ProfileUpdateModelClass.fromJson(Map<String, dynamic> json) =>
      ProfileUpdateModelClass(
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
    this.userName,
    this.companyName,
    this.emailId,
    this.mobileNumber,
    this.gstNumber,
    this.address,
    this.street,
    this.stateId,
    this.cityId,
    this.state,
    this.city,
    this.pincode,
    this.profilePicture,
    this.createdAt,
  });

  String? userName;
  String? companyName;
  String? emailId;
  String? mobileNumber;
  String? gstNumber;
  String? address;
  String? street;
  String? stateId;
  String? cityId;
  String? state;
  String? city;
  String? pincode;
  String? profilePicture;
  DateTime? createdAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userName: json["userName"],
        companyName: json["companyName"],
        emailId: json["email_id"],
        mobileNumber: json["mobileNumber"],
        gstNumber: json["gstNumber"],
        address: json["address"],
        street: json["street"],
        stateId: json["state_id"],
        cityId: json["city_id"],
        state: json["state"],
        city: json["city"],
        pincode: json["pincode"],
        profilePicture: json["profile_picture"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "companyName": companyName,
        "email_id": emailId,
        "mobileNumber": mobileNumber,
        "gstNumber": gstNumber,
        "address": address,
        "street": street,
        "state_id": stateId,
        "city_id": cityId,
        "state": state,
        "city": city,
        "pincode": pincode,
        "profile_picture": profilePicture,
        "created_at": createdAt!.toIso8601String(),
      };
}
