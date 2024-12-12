import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  var notes = [
    {'note': 'This is note', 'priority': 'high'},
    {'note': 'This is note', 'priority': 'medium'},
    {'note': 'This is note', 'priority': 'low'},
    {'note': 'This is note', 'priority': 'high'},
  ].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
