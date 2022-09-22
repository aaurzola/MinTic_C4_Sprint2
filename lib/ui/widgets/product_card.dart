import 'package:f_shopping_app_r2_template/ui/controllers/shopping_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/product.dart';

class ProductCard extends GetView<ShoppingController> {
  final String imgSource;
  final String productName;
  final int value;
  final int id;

  const ProductCard({
    Key? key,
    required this.imgSource,
    required this.productName,
    required this.value,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(height: 120, imgSource),
          ListTile(
            title: Text(productName),
            subtitle: Text("$value USD"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: const Text("Add to cart"),
                onPressed: () => {
                  controller
                      .agregarNuevoProducto(Product(id, productName, value))
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
