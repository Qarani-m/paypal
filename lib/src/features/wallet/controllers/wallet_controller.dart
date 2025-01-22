import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletController extends GetxController with GetTickerProviderStateMixin {  // Changed this line
  late TabController tabController;
  late TabController paypalBalanceTabController;
  
  // Separate indices for each tab controller
  final RxInt mainTabIndex = 0.obs;
  final RxInt paypalTabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    
    tabController = TabController(length: 2, vsync: this);
    paypalBalanceTabController = TabController(length: 2, vsync: this);
    
    // Listen to main tab changes
    tabController.addListener(() {
      mainTabIndex.value = tabController.index;
    });

    // Listen to PayPal balance tab changes
    paypalBalanceTabController.addListener(() {
      paypalTabIndex.value = paypalBalanceTabController.index;
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    paypalBalanceTabController.dispose();
    super.onClose();
  }

  // Method to change main tab
  void changeMainTab(int index) {
    tabController.animateTo(index);
    mainTabIndex.value = index;
  }

  // Method to change PayPal balance tab
  void changePaypalTab(int index) {
    paypalBalanceTabController.animateTo(index);
    paypalTabIndex.value = index;
  }

  // Method to change both tabs if needed
  void changeBothTabs(int index) {
    tabController.animateTo(index);
    paypalBalanceTabController.animateTo(index);
    mainTabIndex.value = index;
    paypalTabIndex.value = index;
  }
}