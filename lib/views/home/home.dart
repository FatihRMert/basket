import 'package:basket_app/domain/basket_model.dart';
import 'package:basket_app/domain/product_list_model.dart';
import 'package:basket_app/views/product_list/product_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BasketModel>(
      create: (context) => BasketModel(),
      builder: (context, value) => Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          leading: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Provider.of<ProductListModel>(context, listen: false).addRandom();
            },
          ),
          actions: const [Badge()],
          centerTitle: true,
        ),
        body: ProductList(),
      ),
    );
  }
}

class Badge extends StatelessWidget {
  const Badge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Consumer<BasketModel>(
        builder: (context, value, child) => GestureDetector(
          child: CircleAvatar(child: Text(value.totalPrice.toString())),
          onTap: () {
            print("100 TL Clicked");
          },
        ),
      ),
    );
  }
}
