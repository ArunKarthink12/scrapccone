// To parse this JSON data, do
//
//     final materialTypeGstModel = materialTypeGstModelFromJson(jsonString);

import 'dart:convert';

MaterialTypeModel materialTypeModelFromJson(String str) =>
    MaterialTypeModel.fromJson(json.decode(str));

String materialTypeModelToJson(MaterialTypeModel data) =>
    json.encode(data.toJson());

class MaterialTypeModel {
  MaterialTypeModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory MaterialTypeModel.fromJson(Map<String, dynamic> json) =>
      MaterialTypeModel(
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
    this.category,
    this.subcategory,
    this.materialType,
  });

  List<Category>? category;
  List<Subcategory>? subcategory;
  List<MaterialType>? materialType;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
        subcategory: List<Subcategory>.from(
            json["subcategory"].map((x) => Subcategory.fromJson(x))),
        materialType: List<MaterialType>.from(
            json["materialType"].map((x) => MaterialType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": List<dynamic>.from(category!.map((x) => x.toJson())),
        "subcategory": List<dynamic>.from(subcategory!.map((x) => x.toJson())),
        "materialType":
            List<dynamic>.from(materialType!.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    this.categoryId,
    this.categoryName,
  });

  int? categoryId;
  String? categoryName;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: json["categoryID"],
        categoryName: json["categoryName"],
      );

  Map<String, dynamic> toJson() => {
        "categoryID": categoryId,
        "categoryName": categoryName,
      };
}

class MaterialType {
  MaterialType({
    this.materialName,
    this.materialId,
    this.amount,
    this.amountPer,
    this.unit,
    this.quantity,
    this.gstamount,
  });

  String? materialName;
  int? materialId;
  int? amount;
  int? amountPer;
  String? unit;
  String? quantity;
  String? gstamount;

  factory MaterialType.fromJson(Map<String, dynamic> json) => MaterialType(
        materialName: json["materialName"],
        materialId: json["materialId"],
        amount: json["amount"],
        amountPer: json["amountPer"],
        unit: json["unit"],
        quantity: json["quantity"],
        gstamount: json["gstamount"],
      );

  Map<String, dynamic> toJson() => {
        "materialName": materialName,
        "materialId": materialId,
        "amount": amount,
        "amountPer": amountPer,
        "unit": unit,
        "quantity": quantity,
        "gstamount": gstamount,
      };
}

class Subcategory {
  Subcategory({
    this.subcategoryId,
    this.subcategoryName,
  });

  int? subcategoryId;
  String? subcategoryName;

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        subcategoryId: json["subcategoryID"],
        subcategoryName: json["subcategoryName"],
      );

  Map<String, dynamic> toJson() => {
        "subcategoryID": subcategoryId,
        "subcategoryName": subcategoryName,
      };
}
