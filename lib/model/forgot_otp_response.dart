// To parse this JSON data, do
//
//     final forgetOtpModel = forgetOtpModelFromJson(jsonString);

import 'dart:convert';

ForgetOtpModel forgetOtpModelFromJson(String str) =>
    ForgetOtpModel.fromJson(json.decode(str));

String forgetOtpModelToJson(ForgetOtpModel data) => json.encode(data.toJson());

class ForgetOtpModel {
  ForgetOtpModel({
    this.status,
    this.message,
  });

  String? status;
  String? message;

  factory ForgetOtpModel.fromJson(Map<String, dynamic> json) => ForgetOtpModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
