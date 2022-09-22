import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../domain/product.dart';

class ShoppingController extends GetxController {
  // lista de productos
  var entries = <Product>[].obs;
  // el valor total de la compra
  var total = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // los dos elementos que vamos a tener en la tienda
    // entries.add(Product(0, "Toy car", 10));
    // entries.add(Product(1, "Toy house", 20));
  }

  void calcularTotal() {
    int newTotal = 0;
    // calcular el valor total de los elementos en el carro de compras
    for (Product product in entries) {
      newTotal += product.quantity * product.price;
    }
    total.value = newTotal;
  }

  aumentarCantidadProducto(id) {
    // Encontrar el elemento usando el id, revisar el método firstWhere de la lista
    Product targetProduct = entries.firstWhere((element) => element.id == id);
    // después obtener el index de ese elemento, revisar el método indexOf de la lista
    int targetIndex = entries.indexOf(targetProduct);
    // después hacer el incremento en la cantidad
    targetProduct.quantity += 1;
    // finalmente actualizar entries usando el indice y el elemento actualizado
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

    // Product targetProduct =
    //     entries.firstWhere((element) => element.id == product.id);
    // int targetIndex = entries.indexOf(targetProduct);
    // targetProduct.quantity += 1;
    // entries[targetIndex] = targetProduct;

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
