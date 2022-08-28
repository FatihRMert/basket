import 'package:basket_app/domain/basket_model.dart';
import 'package:basket_app/domain/product_list_model.dart';
import 'package:basket_app/domain/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductListModel>(
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.products.length,
          itemBuilder: ((context, index) =>
              ProductItem(product: value.products[index])),
        );
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
            "https://upload.wikimedia.org/wikipedia/commons/0/03/Verschiedenfarbige_Schwertlilie_%28Iris_versicolor%29-20200603-RM-100257.jpg",
          ),
        ),
        Expanded(
          child: Column(
              children: [Text(product.name), Text(product.price.toString())]),
        ),
        ProductEqualizer(
          product: product,
        )
      ],
    );
  }
}

class ProductEqualizer extends StatelessWidget {
  final Product product;
  const ProductEqualizer({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BasketModel>(
      builder: (context, value, child) {
        return Row(
          children: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                value.addProduct(product);
                print("Add Clicked");
              },
            ),
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                print("Remove Clicked");
                value.removeProduct(product);
              },
            ),
          ],
        );
      },
    );
  }
}
