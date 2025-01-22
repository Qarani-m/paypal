// lib/src/features/home/controllers/navigation_controller.dart
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final _selectedIndex = 0.obs;
  get selectedIndex => _selectedIndex.value;

  void changePage(int index) {
    _selectedIndex.value = index;
  }
}