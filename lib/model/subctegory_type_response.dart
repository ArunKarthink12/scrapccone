// To parse this JSON data, do
//
//     final subCategoryTypeModel = subCategoryTypeModelFromJson(jsonString);

import 'dart:convert';

SubCategoryTypeModel subCategoryTypeModelFromJson(String str) =>
    SubCategoryTypeModel.fromJson(json.decode(str));

String subCategoryTypeModelToJson(SubCategoryTypeModel data) =>
    json.encode(data.toJson());

class SubCategoryTypeModel {
  SubCategoryTypeModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory SubCategoryTypeModel.fromJson(Map<String, dynamic> json) =>
      SubCategoryTypeModel(
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
    this.materialType,
  });

  List<MaterialType>? materialType;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        materialType: List<MaterialType>.from(
            json["materialType"].map((x) => MaterialType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "materialType":
            List<dynamic>.from(materialType!.map((x) => x.toJson())),
      };
}

class MaterialType {
  MaterialType({
    this.materialName,
    this.materialId,
    this.unit,
    this.imageUrl,
    this.bannerimageUrl,
    this.materialSubtype,
  });

  String? materialName;
  int? materialId;
  String? unit;
  String? imageUrl;
  String? bannerimageUrl;
  List<MaterialSubtype>? materialSubtype;

  factory MaterialType.fromJson(Map<String, dynamic> json) => MaterialType(
        materialName: json["materialName"],
        materialId: json["materialId"],
        unit: json["unit"],
        imageUrl: json["imageUrl"],
        bannerimageUrl: json["bannerimageUrl"],
        materialSubtype: List<MaterialSubtype>.from(
            json["materialSubtype"].map((x) => MaterialSubtype.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "materialName": materialName,
        "materialId": materialId,
        "unit": unit,
        "imageUrl": imageUrl,
        "bannerimageUrl": bannerimageUrl,
        "materialSubtype":
            List<dynamic>.from(materialSubtype!.map((x) => x.toJson())),
      };
}

class MaterialSubtype {
  MaterialSubtype({
    this.type,
    this.id,
    this.price,
  });

  String? type;
  int? id;
  int? price;

  factory MaterialSubtype.fromJson(Map<String, dynamic> json) =>
      MaterialSubtype(
        type: json["type"],
        id: json["id"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "price": price,
      };
}
