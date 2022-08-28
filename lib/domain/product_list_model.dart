import 'dart:math';

import 'package:basket_app/domain/product_model.dart';
import 'package:flutter/material.dart';

class ProductListModel extends ChangeNotifier {
  List<Product> products = [];

  ProductListModel() {
    products.add(Product("Saat", 100));
    products.add(Product("Kıyafet", 40));
    products.add(Product("Ayakkabı", 220));
    products.add(Product("Bileklik", 10));
  }

  add(Product product) {
    products.add(product);
    notifyListeners();
  }

  addRandom() {
    var price = Random.secure().nextInt(100);
    var name = DateTime.now().toUtc().microsecond.toString();
    add(Product(name, price));
  }
}
