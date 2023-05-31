// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  String status;
  String message;
  List<NotificationModelDatum> data;

  NotificationModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        status: json["status"],
        message: json["message"],
        data: List<NotificationModelDatum>.from(
            json["data"].map((x) => NotificationModelDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class NotificationModelDatum {
  String description;
  String name;
  String mobileNumber;
  String title;
  List<DatumDatum> data;

  NotificationModelDatum({
    required this.description,
    required this.name,
    required this.mobileNumber,
    required this.title,
    required this.data,
  });

  factory NotificationModelDatum.fromJson(Map<String, dynamic> json) =>
      NotificationModelDatum(
        description: json["description"],
        name: json["name"],
        mobileNumber: json["mobileNumber"],
        title: json["title"],
        data: List<DatumDatum>.from(
            json["data"].map((x) => DatumDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "name": name,
        "mobileNumber": mobileNumber,
        "title": title,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class DatumDatum {
  String orderId;
  String title;
  String description;
  String profileImage;
  int userid;
  DateTime date;

  DatumDatum({
    required this.orderId,
    required this.title,
    required this.description,
    required this.profileImage,
    required this.userid,
    required this.date,
  });

  factory DatumDatum.fromJson(Map<String, dynamic> json) => DatumDatum(
        orderId: json["order_id"],
        title: json["title"],
        description: json["description"],
        profileImage: json["profileImage"],
        userid: json["userid"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "title": title,
        "description": description,
        "profileImage": profileImage,
        "userid": userid,
        "date": date.toIso8601String(),
      };
}
