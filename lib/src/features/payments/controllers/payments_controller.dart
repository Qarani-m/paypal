import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentsController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
  final RxInt mainTabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    
    // Initialize the TabController
    tabController = TabController(length: 3, vsync: this);
    
    // Listen to main tab changes
    tabController.addListener(() {
      mainTabIndex.value = tabController.index;
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void changeMainTab(int index) {
    tabController.animateTo(index);
    mainTabIndex.value = index;
  }

  void changeBothTabs(int index) {
    tabController.animateTo(index);
    mainTabIndex.value = index;
  }



  List<String> topContacts = [
    'Devin Wood',
    'Samuel Makori',
    'Sharon Ogeto'
  ];
}