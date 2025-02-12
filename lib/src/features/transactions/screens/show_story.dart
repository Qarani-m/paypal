import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paypal/src/features/payments/models/payment_model.dart';

class ShowStory extends StatelessWidget {






  @override
  Widget build(BuildContext context) {
    final transaction = Get.arguments as PaymentModel;
    Map<String, String> nameAndSigns = {'GBP': '£', 'EUR': '€', 'USD': '\$'};

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top section with close button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 12.h,
                    color: Colors.black54,
                  ),
                  onPressed: () => Get.back(),
                ),
              ),
            ),

            // Main content
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 16.r,
                    backgroundColor: Colors.black87,
                    child: Text(
                      getInitials(transaction.name),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Sent to text
                  Text(
                    'You sent ${transaction.name}',
                    style: TextStyle(
                      fontSize: 9.sp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10.h),

                  // Amount
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Text(
                          nameAndSigns[transaction.currency]??nameAndSigns['USD']!,
                          style: TextStyle(
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                      Text(
                        formatToTwoDecimals(transaction.amount),

                        style: TextStyle(
                          fontSize: 30.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Text(
                          transaction.currency.toUpperCase(),
                          style: TextStyle(
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // Family text
                  Text(
                    transaction.message,
                    style: TextStyle(
                      fontSize: 7.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // Bottom message input
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(
                    Icons.emoji_emotions_outlined,
                    color: Colors.black54,
                    size: 12.h,
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: SizedBox(
                      height: 30.h,
                      child: TextField(
                        cursorColor: Colors.black,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 8.5.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.black.withOpacity(0.7)),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(color: const Color.fromARGB(31, 114, 113, 113))),

                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(color: const Color.fromARGB(31, 114, 113, 113))),
                          hintText: 'Message...',
                          contentPadding:
                              EdgeInsets.only(bottom: 5.h, left: 5.w),
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontSize: 7.5.sp,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black.withOpacity(0.7)),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.black,
                    size: 12.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  String getInitials(String? name) {
  if (name == null || name.trim().isEmpty) return 'EN';

  List<String> parts = name.trim().split(RegExp(r'\s+'));
  if (parts.length == 1) {
    return parts[0][0].toUpperCase();
  }

  return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
}

String formatToTwoDecimals(String? number) {
  if (number == null || double.tryParse(number) == null) {
    return '0.00';
  }

  double parsedNumber = double.parse(number);
  return parsedNumber.toStringAsFixed(2);
}


}
