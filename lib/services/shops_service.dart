import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/shop.dart';
import 'package:http/http.dart' as http;

import '../models/shop.dart';
import '../models/auth_token.dart';

import 'firebase_service.dart';

class ProductsService extends FirebaseService {
  ProductsService([AuthToken? authToken]) : super(authToken);

  Future<List<Shop>> fetchProducts(bool filterByUser) async {
    final List<Shop> shops = [];
    final prefs = await SharedPreferences.getInstance();
    final String? _token = prefs.getString('token');
    try {
      // final filters = filterByUser ? 'orderBy="creatorId"&equalto="$userId"':'';
      final productsUrl = Uri.parse('$databaseUrl/shops.json?auth=$token');
      final response = await http.get(productsUrl);
      final productsMap = json.decode(response.body) as Map<String, dynamic>;
      if (response.statusCode != 200) {
        print(productsMap['error']);
        return shops;
      }

      productsMap.forEach((productId, product) {
        shops.add(
          Shop.fromJson({
            'id': productId,
            ...product,
          }),
        );
      });
      return shops;
    } catch (error) {
      print(error);
      return shops;
    }
  }

  Future<Shop?> addProduct(Shop product) async {
    final prefs = await SharedPreferences.getInstance();
    final String? _token = prefs.getString('token');
    try {
      final url = Uri.parse('$databaseUrl/shops.json?auth=$token');
      final response = await http.post(
        url,
        body: json.encode(
          product.toJson()
            ..addAll({
              'creatorId': userId,
            }),
        ),
      );

      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
      return product.copyWith(
        id: json.decode(response.body)['name'],
      );
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<bool> updateShop(Shop product) async {
    try {
      final url =
          Uri.parse('$databaseUrl/shops/${product.id}.json?auth=$token');
      final response =
          await http.patch(url, body: json.encode(product.toJson()));
      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<bool> deleteProduct(String id) async {
    try {
      final url = Uri.parse('$databaseUrl/shops/$id.json?auth=$token');
      final response = await http.delete(url);

      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<bool> saveFavoriteStatus(Shop product) async {
    try {
      final url = Uri.parse(
          '$databaseUrl/userFavorites/$userId/${product.id}.json?auth=$token');
      final response = await http.put(
        url,
        body: json.encode(
          product.isFavorite,
        ),
      );

      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }

      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }
}
