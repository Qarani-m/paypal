import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paypal/src/features/auth/models/user_model.dart';
import 'package:paypal/src/features/payments/models/payment_model.dart';
import 'package:paypal/src/utils/dbhelper_transactions.dart';

class HomepageController extends GetxController {
  final RxList<PaymentModel> recentTransactions = <PaymentModel>[].obs;
  final dbHelper = DBHelper();
  UserModel userDetails = new UserModel(
    balance: '0.00'
  );






String getCategory(String category) {
 if (category.toLowerCase().contains('paypal,refund')) {
   return 'Refund sent - Completed ';
 } else if (category.toLowerCase().contains('recieve,individual')) {
   return 'Money received';
 } else if (category.toLowerCase().contains('send,org')) {
   return 'Send to Organization';
 }
 return category;
}






  @override
  Future<void> onInit() async {
    super.onInit();
    UserModel? fetchedUser = fetchUser();
    userDetails =
        fetchedUser ?? UserModel(); // Use fetched user or create empty model
    await loadRecentTransactions();
  }

  UserModel? fetchUser() {
    final storage = GetStorage();
    var savedUser = storage.read('user_data');

    if (savedUser != null) {
      return UserModel.fromJson(savedUser);
    }

    return null;
  }

  Future<void> loadRecentTransactions() async {
    final transactions = await dbHelper.getLastThreeTransactions();
    recentTransactions.value = transactions
        .map((data) => PaymentModel.fromJson({
              ...data,
              'hasProfilePic': data['hasProfilePic'] == 1,
            }))
        .toList();
  }

  Future<void> deleteAllTransactions() async {
    await dbHelper.deleteAllTransactions();
    recentTransactions.clear();
  }

  Future<void> deleteTransactions(int id) async {
    await dbHelper.deleteOne(id);
    await loadRecentTransactions();
  }

  Future<void> updateTransaction(int id) async {
    final transaction = await dbHelper.readById(id);
    if (transaction == null) return;

    final Map<String, TextEditingController> controllers = {
      'ID': TextEditingController(text: transaction['id'].toString()),
      'Name': TextEditingController(text: transaction['name']),
      'Message': TextEditingController(text: transaction['message']),
      'Currency': TextEditingController(text: transaction['currency']),
      'Amount': TextEditingController(text: transaction['amount']),
      'Transaction Code':
          TextEditingController(text: transaction['transactionCode']),
      'Date': TextEditingController(text: transaction['date']),
      'Time': TextEditingController(text: transaction['time']),
      'Email': TextEditingController(text: transaction['email']),
      'Exchange Rate': TextEditingController(text: transaction['exchangeRate']),
      'Type': TextEditingController(text: transaction['type']),
      'PayPal Fee': TextEditingController(text: transaction['payPalFee']),
      'Direction': TextEditingController(text: transaction['direction']),
      'Has Profile Pic':
          TextEditingController(text: transaction['hasProfilePic'].toString()),
      'Image Path': TextEditingController(text: transaction['imagePath'] ?? ''),
    };

    Get.bottomSheet(
      Container(
        height: Get.height * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Edit Transaction',
                    style: TextStyle(
                        fontSize: 18.sp, fontWeight: FontWeight.w600)),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Get.back(),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controllers.length,
                itemBuilder: (context, index) {
                  String key = controllers.keys.elementAt(index);
                  bool isReadOnly = key == 'ID' || key == 'Created At';
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: TextFormField(
                      controller: controllers[key],
                      readOnly: isReadOnly,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        
                        labelText: key,
                        filled: true,
                        fillColor:
                            isReadOnly ? Colors.grey[100] : Colors.grey[50],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide:
                              BorderSide(color: Color(0xFF0059b3), width: 1.5),
                        ),
                        suffixIcon: key == 'Date' || key == 'Time'
                            ? Icon(Icons.calendar_today)
                            : null,
                      ),
                      onTap: () async {
                        if (key == 'Date') {
                          final date = await showDatePicker(
                            context: Get.context!,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          if (date != null) {
                            controllers[key]!.text =
                                date.toString().split(' ')[0];
                          }
                        } else if (key == 'Time') {
                          final time = await showTimePicker(
                            context: Get.context!,
                            initialTime: TimeOfDay.now(),
                          );
                          if (time != null) {
                            controllers[key]!.text = time.format(Get.context!);
                          }
                        }
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () async {
                final updatedData = Map.fromIterables(
                  controllers.keys
                      .map((k) => k.toLowerCase().replaceAll(' ', '')),
                  controllers.values.map((c) => c.text),
                );
                await dbHelper.update(id, updatedData);
                await loadRecentTransactions();
                Get.back();
                Get.snackbar('Success', 'Transaction updated successfully');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 45.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                backgroundColor: Color(0xFF0059b3),
              ),
              child: Text('Update',
                  style: TextStyle(fontSize: 16.sp, color: Colors.white)),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }
}


// Refund
// Send tobank==
// Send to individual ==
// send to org ==