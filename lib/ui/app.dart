import 'package:f_shopping_app_r2_template/ui/pages/product_list.dart';
import 'package:f_shopping_app_r2_template/ui/widgets/cart_total.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shopping cart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.blueGrey, title: CartTotal()),
        body: const Center(child: HomePage()),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: Colors.lime,
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
          onTap: _switchWindow,
        ),
      ),
    );
  }

  void _switchWindow(int index) {
    if (index == 1) {
      Get.to(() => const ProductList(), transition: Transition.fadeIn);
    }
  }
}
