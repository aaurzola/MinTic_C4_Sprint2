import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/product.dart';
import '../controllers/shopping_controller.dart';
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
            AppBar(
                backgroundColor: Colors.blueGrey,
                leading: ElevatedButton(
                  onPressed: () {
                    shoppingController.deleteAll();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Icon(Icons.delete_sweep),
                )),
            Obx(() => Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: shoppingController.entries.length,
                      itemBuilder: (context, index) {
                        return _row(shoppingController.entries[index], index);
                      }),
                )),
            BottomNavigationBar(
              onTap: _switchWindow,
              selectedItemColor: Colors.lime,
              currentIndex: 1,
              unselectedItemColor: Colors.white,
              backgroundColor: Colors.blueGrey,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.store,
                  ),
                  label: 'Store',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart,
                  ),
                  label: 'Cart',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _switchWindow(int index) {
    if (index == 0) {
      Get.back();
    }
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
                  shoppingController.aumentarCantidadProducto(product.id);
                },
                icon: const Icon(Icons.add),
                color: Colors.green,
                iconSize: 25),
            IconButton(
              onPressed: () {
                if (product.quantity == 1) {
                  shoppingController.removeProduct(product.id);
                } else {
                  shoppingController.quitarProducto(product.id);
                }
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
