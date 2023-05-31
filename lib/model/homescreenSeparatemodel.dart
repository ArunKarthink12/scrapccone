// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  List<Datum>? data;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.categoryId,
    this.categoryImage,
    this.categoryName,
    this.subcategory,
  });

  int? categoryId;
  String? categoryImage;
  String? categoryName;
  List<Subcategory>? subcategory;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        categoryId: json["categoryId"],
        categoryImage: json["categoryImage"],
        categoryName: json["categoryName"],
        subcategory: List<Subcategory>.from(
            json["subcategory"].map((x) => Subcategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "categoryImage": categoryImage,
        "categoryName": categoryName,
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
