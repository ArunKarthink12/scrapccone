// To parse this JSON data, do
//
//     final profileUpdatStateModel = profileUpdatStateModelFromJson(jsonString);

import 'dart:convert';

ProfileUpdatStateModel profileUpdatStateModelFromJson(String str) =>
    ProfileUpdatStateModel.fromJson(json.decode(str));

String profileUpdatStateModelToJson(ProfileUpdatStateModel data) =>
    json.encode(data.toJson());

class ProfileUpdatStateModel {
  ProfileUpdatStateModel({
    this.status,
    this.state,
  });

  int? status;
  List<State>? state = [];

  factory ProfileUpdatStateModel.fromJson(Map<String, dynamic> json) =>
      ProfileUpdatStateModel(
        status: json["status"],
        state: json["state"] == null
            ? []
            : List<State>.from(json["state"].map((x) => State.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "state": List<dynamic>.from(state!.map((x) => x.toJson())),
      };
}

class State {
  State({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory State.fromJson(Map<String, dynamic> json) => State(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
