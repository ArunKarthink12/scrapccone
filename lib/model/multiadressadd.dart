// To parse this JSON data, do
//
//     final multiaddressaddedModel = multiaddressaddedModelFromJson(jsonString);

import 'dart:convert';

MultiaddressaddedModel multiaddressaddedModelFromJson(String str) =>
    MultiaddressaddedModel.fromJson(json.decode(str));

String multiaddressaddedModelToJson(MultiaddressaddedModel data) =>
    json.encode(data.toJson());

class MultiaddressaddedModel {
  String status;
  String message;

  MultiaddressaddedModel({
    required this.status,
    required this.message,
  });

  factory MultiaddressaddedModel.fromJson(Map<String, dynamic> json) =>
      MultiaddressaddedModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
