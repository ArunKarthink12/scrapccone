// To parse this JSON data, do
//
//     final subCategoryModel = subCategoryModelFromJson(jsonString);

import 'dart:convert';

SubCategoryModel subCategoryModelFromJson(String str) =>
    SubCategoryModel.fromJson(json.decode(str));

String subCategoryModelToJson(SubCategoryModel data) =>
    json.encode(data.toJson());

class SubCategoryModel {
  SubCategoryModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      SubCategoryModel(
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
    this.subcategory,
  });

  List<Subcategory>? subcategory;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        subcategory: List<Subcategory>.from(
            json["subcategory"].map((x) => Subcategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "subcategory": List<dynamic>.from(subcategory!.map((x) => x.toJson())),
      };
}

class Subcategory {
  Subcategory({
    this.subcategoryId,
    this.subcategoryImage,
    this.subcategoryName,
    this.bannerimageUrl,
  });

  int? subcategoryId;
  String? subcategoryImage;
  String? subcategoryName;
  String? bannerimageUrl;

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        subcategoryId: json["subcategoryId"],
        subcategoryImage: json["subcategoryImage"],
        subcategoryName: json["subcategoryName"],
        bannerimageUrl: json["bannerimageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "subcategoryId": subcategoryId,
        "subcategoryImage": subcategoryImage,
        "subcategoryName": subcategoryName,
        "bannerimageUrl": bannerimageUrl,
      };
}
