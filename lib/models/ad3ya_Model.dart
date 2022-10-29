//
//     final ad3YaModel = ad3YaModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names, file_names

import 'dart:convert';

Map<String, List<Ad3YaModel>> ad3YaModelFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) => MapEntry<String, List<Ad3YaModel>>(
        k, List<Ad3YaModel>.from(v.map((x) => Ad3YaModel.fromJson(x)))));

String ad3YaModelToJson(Map<String, List<Ad3YaModel>> data) =>
    json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(
        k, List<dynamic>.from(v.map((x) => x.toJson())))));

class Ad3YaModel {
  Ad3YaModel({
    required this.category,
    required this.count,
    required this.description,
    required this.reference,
    required this.content,
  });

  Category? category;
  String count;
  String description;
  String reference;
  String content;

  factory Ad3YaModel.fromJson(Map<String, dynamic> json) => Ad3YaModel(
        category: categoryValues.map[json["category"]],
        count: json["count"],
        description: json["description"],
        reference: json["reference"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "category": categoryValues.reverse![category],
        "count": count,
        "description": description,
        "reference": reference,
        "content": content,
      };
}

enum Category {
  EMPTY,
  CATEGORY,
  PURPLE,
  FLUFFY,
  TENTACLED,
  STICKY,
  INDIGO,
  INDECENT
}

final categoryValues = EnumValues({
  "أدعية قرآنية": Category.CATEGORY,
  "أدعية الأنبياء": Category.EMPTY,
  "أذكار الصباح": Category.FLUFFY,
  "تسابيح": Category.INDECENT,
  "أذكار بعد السلام من الصلاة المفروضة": Category.INDIGO,
  "أذكار الاستيقاظ": Category.PURPLE,
  "أذكار النوم": Category.STICKY,
  "أذكار المساء": Category.TENTACLED
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
