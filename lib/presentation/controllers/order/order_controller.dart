import 'package:get/get.dart';

class OrderController extends GetxController {
  RxList<String> orderItems = <String>[].obs;
  RxDouble total = 0.0.obs;

  void addItemToOrder(String item, double price) {
    orderItems.add(item);
    total.value += price;
  }

  void removeItemFromOrder(String item, double price) {
    orderItems.remove(item);
    total.value -= price;
  }

  void clearOrder() {
    orderItems.clear();
    total.value = 0.0;
  }
}
