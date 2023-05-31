// To parse this JSON data, do
//
//     final forgotOtpResendModel = forgotOtpResendModelFromJson(jsonString);

import 'dart:convert';

ForgotOtpResendModel forgotOtpResendModelFromJson(String str) =>
    ForgotOtpResendModel.fromJson(json.decode(str));

String forgotOtpResendModelToJson(ForgotOtpResendModel data) =>
    json.encode(data.toJson());

class ForgotOtpResendModel {
  ForgotOtpResendModel({
    this.status,
    this.message,
  });

  String? status;
  String? message;

  factory ForgotOtpResendModel.fromJson(Map<String, dynamic> json) =>
      ForgotOtpResendModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
