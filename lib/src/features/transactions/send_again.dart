import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paypal/src/features/payments/models/payment_model.dart';
import 'package:paypal/src/utils/utilities.dart';

class PaymentPageController extends GetxController {
  RxString currencyOne = "GBP".obs;
  RxString currencyTwo = "USD".obs;

  RxBool showDetails = false.obs;

  onIni() async {}

  @override
  void onInit() async {
    super.onInit();

    // After 300ms, set showDetails to true
    Future.delayed(Duration(milliseconds: 300), () {
      showDetails.value = true;
    });
  }

  Future<void> fillInTheDetails() async {
    final box = GetStorage();
    final PaymentPageController controller = Get.find();

    // Retrieve saved data
    Map<String, dynamic>? savedData = box.read("amountCurrencies");

    if (savedData != null) {
      // Update observables
      controller.currencyOne.value = savedData["currency1"] ?? "\$";
      controller.currencyTwo.value = savedData["currency2"] ?? "\$";
    }
  }
}

class PaymentPage extends StatelessWidget {
  PaymentPage({super.key, required this.transaction});
  final PaymentModel transaction;

  Future<void> fillInTheDetails() async {}

  final PaymentPageController pageController = Get.put(PaymentPageController());

  @override
  Widget build(BuildContext context) {
    Map<String, String> nameAndSigns = {
  'GBP': '\u00A3', // Pound (£)
  'EUR': '\u20AC', // Euro (€)
  'USD': '\u0024', // Dollar ($)
};

    final FocusNode _focusNode = FocusNode();

    pageController.fillInTheDetails();
    // Future.delayed(Duration(milliseconds: 300), () {
    // FocusScope.of(context).requestFocus(_focusNode);
    // });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 15.h), // Adjust size here
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          !pageController.showDetails.value?'':"Amount",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(1)),
        ),
      ),
      body: Obx(
        () => !pageController.showDetails.value
            ? Center(
                child: SizedBox(
                  height: 20.h,
                  width: 20.h,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: 3.0, sigmaY: 3.0), // Blur effect

                    child: CircularProgressIndicator(
                      color: Colors.grey,
                      strokeWidth: 1.3,
                    ),
                  ),
                ),
              )
            : Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    transaction.hasProfilePic
                        ? Container(
                            height: 50.h,
                            width: 50.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[300],
                            ),
                            child: ClipOval(
                              child: Image.file(
                                File(transaction.imagePath),
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Icon(Icons.person,
                                      color: Colors.grey[600]);
                                },
                              ),
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            height: 50.h,
                            width: 50.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFF2e3333),
                            ),
                            child: Text(
                              AppUtilities().getInitials(transaction.name),
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction.name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          transaction.email,
                          style:
                              TextStyle(color: Colors.black, fontSize: 10.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    Text(
                      'You send',
                      style: TextStyle(color: Colors.black, fontSize: 11.sp),
                    ),
                    Row(
                      children: [
                        Text(
                          '${nameAndSigns[pageController.currencyOne]}0',
                          style: TextStyle(
                              fontSize: 35.sp,
                            fontFamily: 'PayPalDefault',

                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: Text(
                            pageController.currencyOne.value,
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: Colors.grey.withOpacity(0.1),
                        )),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)),
                              ),
                              builder: (context) {
                                TextEditingController currency1Controller =
                                    TextEditingController();
                                TextEditingController currency2Controller =
                                    TextEditingController();
                                final box = GetStorage();

                                return Padding(
                                  padding: EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    top: 20,
                                    bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom +
                                        20,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller: currency1Controller,
                                        decoration: InputDecoration(
                                            labelText: "Enter first currency"),
                                      ),
                                      SizedBox(height: 10),
                                      TextField(
                                        controller: currency2Controller,
                                        decoration: InputDecoration(
                                            labelText: "Enter second currency"),
                                      ),
                                      SizedBox(height: 20),
                                      ElevatedButton(
                                        onPressed: () {
                                          box.write("amountCurrencies", {
                                            "currency1":
                                                currency1Controller.text,
                                            "currency2":
                                                currency2Controller.text,
                                          });
                                          pageController.currencyOne.value =
                                              currency1Controller.text;
                                          pageController.currencyTwo.value =
                                              currency2Controller.text;
                                          Get.back(); // Close the bottom sheet
                                        },
                                        child: Text("Submit"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(6.h),
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: Icon(
                              Icons.swap_vert,
                              size: 20.h,
                              color: Colors.black.withOpacity(0.9),
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      'They receive',
                      style: TextStyle(color: Colors.black, fontSize: 11.sp),
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                                // fontFamily: 'PayPalSans',
                                fontSize: 35.sp,
                            fontFamily: 'PayPalDefault',

                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                            children: [
                              TextSpan(
                                text:
                                    '${nameAndSigns[pageController.currencyTwo]}',
                              ),
                              WidgetSpan(
                                child: _buildBlinkingCursor(),
                              ),
                              TextSpan(text: '0'),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: Text(
                            pageController.currencyTwo.value,
                            style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'This rate includes a currency conversion spread.',
                      style: TextStyle(color: Colors.black, fontSize: 9.sp),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 35.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r)),
                            child: TextField(
 autofocus: true,
                              keyboardType: TextInputType.number,
                              showCursor: false, // Hides the cursor
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black45,
                                ),
                                hintText: 'Add a message',
                                filled: true,
                                fillColor: Colors.grey[200]!.withOpacity(0.2),

                                // Remove all borders
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            width:
                                10), // Add spacing between TextField and Button
                        SizedBox(
                          width: 100.w, // Set a fixed width for the button
                          child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 9.h),
                              decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius: BorderRadius.circular(20.r)),
                              child: Text('Next',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w600))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildBlinkingCursor() {
    // Use GetX for reactive state management
    return GetX<CursorController>(
      init: CursorController(),
      builder: (controller) {
        return Container(
          width: 1.w,
          height: 35.sp,
          color:
              Colors.black.withOpacity(controller.isVisible.value ? 0.8 : 0.0),
          margin: EdgeInsets.symmetric(horizontal: 2),
        );
      },
    );
  }
}

// Define a GetX controller for the cursor
class CursorController extends GetxController {
  var isVisible = true.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _startBlinking();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void _startBlinking() {
    // Create a timer that toggles visibility every 500ms
    _timer = Timer.periodic(Duration(milliseconds: 500), (_) {
      isVisible.value = !isVisible.value;
    });
  }
}
