// lib/src/features/home/controllers/navigation_controller.dart
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final _selectedIndex = 0.obs;
  get selectedIndex => _selectedIndex.value;

  void changePage(int index, {String animate = 'null'}) {

    if(animate!='null'){

      if(animate == 'home'){
        Get.toNamed('/home');
      }

    }else{
    _selectedIndex.value = index;
    }
  }


//not in use
  void changePageB(int index, {String animate = 'null'}) {

    if(animate!='null'){

      if(animate == 'home'){
        Get.toNamed('/home');
      }

    }else{
    _selectedIndex.value = index;
    }
  }
}