// To parse this JSON data, do
//
//     final boredModel = boredModelFromJson(jsonString);

import 'dart:convert';

BoredModel boredModelFromJson(String str) =>
    BoredModel.fromJson(json.decode(str));

String boredModelToJson(BoredModel data) => json.encode(data.toJson());

class BoredModel {
  BoredModel({
    required this.activity,
    required this.type,
    required this.participants,
  });

  String activity;
  String type;
  dynamic participants;

  factory BoredModel.fromJson(Map<String, dynamic> json) => BoredModel(
        activity: json["activity"],
        type: json["type"],
        participants: json["participants"],
      );

  Map<String, dynamic> toJson() => {
        "activity": activity,
        "type": type,
        "participants": participants,
      };
}
