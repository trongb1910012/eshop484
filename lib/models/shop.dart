import 'package:flutter/foundation.dart';

class Shop {
  final String? id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final ValueNotifier<bool> _isFavorite;
  Shop({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    isFavorite = false,
  }) : _isFavorite = ValueNotifier(isFavorite);

  set isFavorite(bool newValue) {
    _isFavorite.value = newValue;
  }

  bool get isFavorite {
    return _isFavorite.value;
  }

  ValueNotifier<bool> get isFavoriteListenable {
    return _isFavorite;
  }

  Shop copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    bool? isFavorite,
  }) {
    return Shop(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl
    };
  }

  static Shop fromJson(Map<String, dynamic> json) {
    return Shop(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        imageUrl: json['imageUrl']);
  }
}
