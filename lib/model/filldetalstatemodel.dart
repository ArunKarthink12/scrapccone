// To parse this JSON data, do
//
//     final fillstatemodel = fillstatemodelFromJson(jsonString);

import 'dart:convert';

Fillstatemodel fillstatemodelFromJson(String str) =>
    Fillstatemodel.fromJson(json.decode(str));

String fillstatemodelToJson(Fillstatemodel data) => json.encode(data.toJson());

class Fillstatemodel {
  Fillstatemodel({
    this.status,
    this.state,
  });

  int? status;
  List<State>? state;

  factory Fillstatemodel.fromJson(Map<String, dynamic> json) => Fillstatemodel(
        status: json["status"],
        state: List<State>.from(json["state"].map((x) => State.fromJson(x))),
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
