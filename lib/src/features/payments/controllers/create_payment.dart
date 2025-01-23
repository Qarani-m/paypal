import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paypal/src/utils/dbhelper_transactions.dart';




class CreatePaymentController extends GetxController {


      List<String> actions = [
      'Individual',
      'Org',
      'Bank',
      'Recovery',
      'Refund',
      'Individual',
      'Org'
    ];

    List<String > category = [
      'Send','Paypal', 'recieve'
    ];


  final RxBool showOther = false.obs;
  final RxInt selectedTab = 0.obs;
 // Observables
 final name = ''.obs;
 final amount = ''.obs; 
 final exchangeRate = ''.obs; 
 final payPalFee = ''.obs; 
 final message = ''.obs;
 final email = ''.obs;
 final currency = 'USD'.obs;
 final selectedDate = Rxn<DateTime>();
 final selectedTime = Rxn<TimeOfDay>();

 // Functions to update values
 void updateName(String value) => name.value = value;
 void updatePaypalFee(String value) => payPalFee.value = value;
 void updateExchangeRate(String value) => exchangeRate.value = value;
 void updateAmount(String value) => amount.value = value;
 void updateMessage(String value) => message.value = value;
 void updateEmail(String value) => email.value = value;
 void updateCurrency(String value) => currency.value = value;
 void updateDate(DateTime? date) => selectedDate.value = date;
 void updateTime(TimeOfDay? time) => selectedTime.value = time;
 void updateSelectedTab(int index) => selectedTab.value = index;

 // Get formatted date/time strings
 String get formattedDate => selectedDate.value?.toString() ?? 'Select Date';
 String get formattedTime => selectedTime.value?.format(Get.context!) ?? 'Select Time';





  final DBHelper _dbHelper = DBHelper();


 Future<void> savePayment() async {
   try {
     final payment = {
       'name': name.value,
       'message': message.value,
       'currency': currency.value,
       'amount': amount.value,
       'transactionCode': DateTime.now().millisecondsSinceEpoch.toString(),
       'date': selectedDate.value?.toString() ?? '',
       'time': selectedTime.value?.format(Get.context!) ?? '',
       'email': email.value, // Add email field in UI if needed
       'exchangeRate': exchangeRate.value, // Add exchange rate logic
       'payPalFee': payPalFee.value, // Add PayPal fee calculation
       'hasProfilePic': 0,
       'type': category[selectedTab.value],
       'to':actions[ selectedTab.value]

     };

     print(payment);

    //  await _dbHelper.insertOne(payment);
    //  Get.snackbar('Success', 'Payment saved successfully');
     
   } catch (e) {
     Get.snackbar('Error', 'Failed to save payment: $e');
   }
 }

}