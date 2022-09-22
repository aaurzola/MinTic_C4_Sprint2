import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../domain/product.dart';

class ShoppingController extends GetxController {
  var entries = <Product>[].obs;
  var total = 0.obs;

  void calcularTotal() {
    int newTotal = 0;
    for (Product product in entries) {
      newTotal += product.quantity * product.price;
    }
    total.value = newTotal;
  }

  aumentarCantidadProducto(id) {
    Product targetProduct = entries.firstWhere((element) => element.id == id);
    int targetIndex = entries.indexOf(targetProduct);
    targetProduct.quantity += 1;
    entries[targetIndex] = targetProduct;
    calcularTotal();
  }

  agregarNuevoProducto(Product product) {
    if (!entries.any((element) => element.id == product.id)) {
      entries.add(product);
    } else {
      Product targetProduct =
          entries.firstWhere((element) => element.id == product.id);
      int targetIndex = entries.indexOf(targetProduct);
      targetProduct.quantity += 1;
      entries[targetIndex] = targetProduct;
    }
    calcularTotal();
  }

  quitarProducto(id) {
    logInfo('quitarProducto $id');
    Product targetProduct = entries.firstWhere((element) => element.id == id);
    int targetIndex = entries.indexOf(targetProduct);
    if (targetProduct.quantity > 0) {
      targetProduct.quantity -= 1;
    }
    entries[targetIndex] = targetProduct;
    calcularTotal();
  }

  void deleteAll() {
    entries.clear();
    calcularTotal();
  }

  void removeProduct(int id) {
    Product targetProduct = entries.firstWhere((element) => element.id == id);
    int targetIndex = entries.indexOf(targetProduct);
    entries.removeAt(targetIndex);
    calcularTotal();
  }
}
