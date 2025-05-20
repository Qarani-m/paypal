import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:paypal/src/utils/dbhelper_transactions.dart';

import 'package:path/path.dart' as path;

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

  List<String> category = ['Send', 'Paypal', 'recieve'];

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
  String get formattedTime =>
      selectedTime.value?.format(Get.context!) ?? 'Select Time';

  final currencies = ['EUR', 'USD', 'GBP', 'CAD', 'AUD'];

  final DBHelper _dbHelper = DBHelper();

  Future<void> savePayment() async {
    try {
      String? imagePath;
      if (_imageFile.value != null) {
        final appDir = await getApplicationDocumentsDirectory();
        final fileName =
            'transaction_${DateTime.now().millisecondsSinceEpoch}.jpg';
        imagePath = '${appDir.path}/$fileName';
        await _imageFile.value!.copy(imagePath);
      }

      final payment = {
        'name': name.value,
        'message': message.value,
        'currency': currency.value,
        'amount': amount.value,
        'transactionCode': DateTime.now().millisecondsSinceEpoch.toString(),
        'date': selectedDate.value?.toString().split(' ')[0] ?? '',
        'time': selectedTime.value?.format(Get.context!) ?? '',
        'email': email.value,
        'exchangeRate': exchangeRate.value,
        'payPalFee': payPalFee.value,
        'hasProfilePic': _imageFile.value != null ? 1 : 0,
        'imagePath': imagePath,
        'type': selectedTab.value <= 2
            ? category[0]
            : selectedTab.value <= 4
                ? category[1]
                : category[2],
        'direction': actions[selectedTab.value]
      };


      final result = await _dbHelper.insertOne(payment);
      if (result != null) {
        print('Transaction added successfully: ${result['transactionCode']}');
      }
      Get.snackbar('Success', 'Payment saved successfully');
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Failed to save payment: $e');
    }
  }

  final _imageFile = Rx<File?>(null);
  File? get imageFile => _imageFile.value;

  final _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final Directory appDir = await getApplicationDocumentsDirectory();
      final String fileName = path.basename(pickedFile.path);
      final File localImage = File('${appDir.path}/$fileName');
      await File(pickedFile.path).copy(localImage.path);
      _imageFile.value = localImage;
    }
  }
}
