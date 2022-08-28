import 'package:basket_app/domain/product_model.dart';
import 'package:flutter/material.dart';

class BasketModel extends ChangeNotifier {
  List<Product> products = [];

  int totalPrice = 0;
  addProduct(Product product) {
    products.add(product);
    totalPrice += product.price;
    notifyListeners();
  }

  removeProduct(Product product) {
    products.remove(product);
    totalPrice -= product.price;
    notifyListeners();
  }
}
