import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imgSource;
  final String productName;
  final int value;

  const ProductCard({
    Key? key,
    required this.imgSource,
    required this.productName,
    required this.value,
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
                child: const Text("ADD"),
                onPressed: () => {print("add")},
              ),
            ],
          )
        ],
      ),
    );
  }
}
