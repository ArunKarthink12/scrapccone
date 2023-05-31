// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.message,
    this.token,
    this.data,
  });

  String? status;
  String? message;
  String? token;
  Data? data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        token: json["token"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.userid,
    this.code,
    this.name,
    this.email,
    this.gender,
    this.emailVerifiedAt,
    this.phoneNo,
    this.dob,
    this.marriedDate,
    this.address,
    this.city,
    this.state,
    this.zipCode,
    this.password1,
    this.status,
    this.isMember,
    this.profilePicture,
    this.smsCount,
    this.smLogin,
    this.facebookId,
    this.googleId,
    this.educationDetail,
    this.type,
    this.aadharNo,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.layout,
    this.otpStatus,
  });

  int? id;
  int? userid;
  int? code;
  String? name;
  String? email;
  dynamic gender;
  dynamic emailVerifiedAt;
  String? phoneNo;
  dynamic dob;
  dynamic marriedDate;
  dynamic address;
  dynamic city;
  dynamic state;
  dynamic zipCode;
  String? password1;
  String? status;
  int? isMember;
  dynamic profilePicture;
  int? smsCount;
  int? smLogin;
  dynamic facebookId;
  dynamic googleId;
  dynamic educationDetail;
  int? type;
  dynamic aadharNo;
  DateTime? createdAt;
  dynamic updatedAt;
  dynamic createdBy;
  int? layout;
  int? otpStatus;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userid: json["userid"],
        code: json["code"],
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        emailVerifiedAt: json["email_verified_at"],
        phoneNo: json["phone_no"] ?? '',
        dob: json["dob"],
        marriedDate: json["married_date"],
        address: json["address"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zip_code"],
        password1: json["password1"] ?? '',
        status: json["status"],
        isMember: json["is_member"],
        profilePicture: json["profile_picture"],
        smsCount: json["sms_count"],
        smLogin: json["sm_login"],
        facebookId: json["facebook_id"],
        googleId: json["google_id"],
        educationDetail: json["education_detail"],
        type: json["type"],
        aadharNo: json["aadhar_no"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        createdBy: json["created_by"],
        layout: json["layout"],
        otpStatus: json["otp_status"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userid": userid,
        "code": code,
        "name": name,
        "email": email,
        "gender": gender,
        "email_verified_at": emailVerifiedAt,
        "phone_no": phoneNo,
        "dob": dob,
        "married_date": marriedDate,
        "address": address,
        "city": city,
        "state": state,
        "zip_code": zipCode,
        "password1": password1,
        "status": status,
        "is_member": isMember,
        "profile_picture": profilePicture,
        "sms_count": smsCount,
        "sm_login": smLogin,
        "facebook_id": facebookId,
        "google_id": googleId,
        "education_detail": educationDetail,
        "type": type,
        "aadhar_no": aadharNo,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt,
        "created_by": createdBy,
        "layout": layout,
        "otp_status": otpStatus,
      };
}
