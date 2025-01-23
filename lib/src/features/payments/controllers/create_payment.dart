import 'package:flutter/material.dart';
import 'package:get/get.dart';




class CreatePaymentController extends GetxController {
 // Observables
 final name = ''.obs;
 final amount = ''.obs; 
 final message = ''.obs;
 final currency = 'USD'.obs;
 final selectedDate = Rxn<DateTime>();
 final selectedTime = Rxn<TimeOfDay>();

 // Functions to update values
 void updateName(String value) => name.value = value;
 void updateAmount(String value) => amount.value = value;
 void updateMessage(String value) => message.value = value;
 void updateCurrency(String value) => currency.value = value;
 void updateDate(DateTime? date) => selectedDate.value = date;
 void updateTime(TimeOfDay? time) => selectedTime.value = time;

 // Get formatted date/time strings
 String get formattedDate => selectedDate.value?.toString() ?? 'Select Date';
 String get formattedTime => selectedTime.value?.format(Get.context!) ?? 'Select Time';
}