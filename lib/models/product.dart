// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Model model;
  int pk;
  Fields fields;

  Product({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
  int user;
  String name;
  DateTime dateAdded;
  int? sell;
  int price;
  String description;
  String? modifiers;
  int? amount;
  dynamic options;

  Fields({
    required this.user,
    required this.name,
    required this.dateAdded,
    required this.sell,
    required this.price,
    required this.description,
    required this.modifiers,
    required this.amount,
    required this.options,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        dateAdded: DateTime.parse(json["date_added"]),
        sell: json["sell"],
        price: json["price"],
        description: json["description"],
        modifiers: json["modifiers"],
        amount: json["amount"],
        options: json["options"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "date_added":
            "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
        "sell": sell,
        "price": price,
        "description": description,
        "modifiers": modifiers,
        "amount": amount,
        "options": options,
      };
}

enum Model { MAIN_ITEM }

final modelValues = EnumValues({"main.item": Model.MAIN_ITEM});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
