import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/product.dart';
import '../controllers/shopping_controller.dart';
import '../widgets/banner.dart';
import '../widgets/customTitleText.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  ShoppingController shoppingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [const CustomBanner(50), customAppBar()],
            ),
            Obx(() => Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: shoppingController.entries.length,
                      itemBuilder: (context, index) {
                        return _row(shoppingController.entries[index], index);
                      }),
                ))
          ],
        ),
      ),
    );
  }

  Widget customAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 30,
            ),
          ),
        )
      ],
    );
  }

  Widget _row(Product product, int index) {
    return _card(product);
  }

  Widget _card(Product product) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Column(
          children: [
            const Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: CartColumnTittle(title: "Product")),
            Text(product.name),
          ],
        ),
        Column(
          children: [
            const Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: CartColumnTittle(title: "Price")),
            Text(product.price.toString()),
          ],
        ),
        Column(
          children: [
            IconButton(
                onPressed: () {
                  shoppingController.agregarProducto(product.id);
                },
                icon: const Icon(Icons.add),
                color: Colors.green,
                iconSize: 25),
            IconButton(
              onPressed: () {
                shoppingController.quitarProducto(product.id);
              },
              icon: const Icon(Icons.remove),
              color: Colors.red,
              iconSize: 25,
            )
          ],
        ),
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: CartColumnTittle(title: "Quantity"),
            ),
            Text(product.quantity.toString()),
          ],
        )
      ]),
    );
  }
}
