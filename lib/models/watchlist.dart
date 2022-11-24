import 'package:flutter/material.dart';
import 'package:counter_7/pages/form.dart';
import 'package:counter_7/pages/result.dart';
import 'package:counter_7/main.dart';
import 'dart:convert';

List<Watchlist> watchlistFromJson(String str) =>
    List<Watchlist>.from(json.decode(str).map((x) => Watchlist.fromJson(x)));

String watchlistToJson(List<Watchlist> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Watchlist {
  Watchlist({
    required this.model,
    required this.pk,
    required this.fields,
  });

  final Model model;
  final int pk;
  final Fields fields;

  factory Watchlist.fromJson(Map<String, dynamic> json) => Watchlist(
        model: modelValues.map[json["model"]]!,
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.itemWatched,
    required this.itemTitle,
    required this.itemRating,
    required this.itemReleaseDate,
    required this.itemReview,
  });

  final bool itemWatched;
  final String itemTitle;
  final int itemRating;
  final String itemReleaseDate;
  final String itemReview;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        itemWatched: itemWatchedValues.map[json["item_watched"]]!,
        itemTitle: json["item_title"],
        itemRating: json["item_rating"],
        itemReleaseDate: json["item_release_date"],
        itemReview: json["item_review"],
      );

  Map<String, dynamic> toJson() => {
        "item_watched": itemWatchedValues.reverse[itemWatched],
        "item_title": itemTitle,
        "item_rating": itemRating,
        "item_release_date": itemReleaseDate,
        "item_review": itemReview,
      };
}

final itemWatchedValues = EnumValues({"No": false, "Yes": true});

enum Model { MYWATCHLIST_WATCHLISTITEM }

final modelValues =
    EnumValues({"mywatchlist.watchlistitem": Model.MYWATCHLIST_WATCHLISTITEM});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
