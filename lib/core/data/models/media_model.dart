// To parse this JSON data, do
//
//     final mediaModel = mediaModelFromJson(jsonString);

import 'dart:convert';

MediaModel mediaModelFromJson(String str) =>
    MediaModel.fromJson(json.decode(str));

String mediaModelToJson(MediaModel data) => json.encode(data.toJson());

class MediaModel {
  final int? id;
  final String? url;
  final String? preview;
  final dynamic hash;
  final String? name;

  MediaModel({
    this.id,
    this.url,
    this.preview,
    this.hash,
    this.name,
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) => MediaModel(
        id: json["id"],
        url: json["url"],
        preview: json["preview"],
        hash: json["hash"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "preview": preview,
        "hash": hash,
        "name": name,
      };
}
