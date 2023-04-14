import 'package:flutter/foundation.dart';

import '../../models/auth_token.dart';
import '../../models/shop.dart';
import '../../services/shops_service.dart';

class ShopManager with ChangeNotifier {
  List<Shop> _items = [];

  final ProductsService _productsService;

  ShopManager([AuthToken? authToken])
      : _productsService = ProductsService(authToken);

  set authToken(AuthToken? authToken) {
    _productsService.authToken = authToken;
  }

  Future<void> fetchProducts([bool filterByUser = false]) async {
    _items = await _productsService.fetchProducts(filterByUser);
    notifyListeners();
  }

  int get itemCount {
    return _items.length;
  }

  List<Shop> get shops {
    return [..._items];
  }

  List<Shop> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Shop findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> addProduct(Shop product) async {
    final newProduct = await _productsService.addProduct(product);
    if (newProduct != null) {
      _items.add(newProduct);
      notifyListeners();
    }
  }

  Future<void> updateProduct(Shop product) async {
    final index = _items.indexWhere((item) => item.id == product.id);
    if (index >= 0) {
      if (await _productsService.updateShop(product)) {
        _items[index] = product;
        notifyListeners();
      }
    }
  }

  Future<void> toggleFavoriteStatus(Shop product) async {
    final savedStatus = product.isFavorite;
    product.isFavorite = !savedStatus;
    if (!await _productsService.saveFavoriteStatus(product)) {
      product.isFavorite = savedStatus;
    }
  }

  Future<void> deleteProduct(String id) async {
    final index = _items.indexWhere((item) => item.id == id);
    Shop? existingProducct = _items[index];
    _items.removeAt(index);
    notifyListeners();
    if (!await _productsService.deleteProduct(id)) {
      _items.insert(index, existingProducct);
      notifyListeners();
    }
  }
}
