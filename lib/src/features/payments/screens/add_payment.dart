import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paypal/src/features/payments/controllers/create_payment.dart';

class AddPayment extends GetView<CreatePaymentController> {
  const AddPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 12.sp), // Adjust size here
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Color(0xFFeff2f9),
        centerTitle: true,
        title: Text(
          "Amount",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 8.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(1)),
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Container(
                // color: Colors.red,/
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20.r,
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: Container(
                            width: 200.w,
                            child: EditableText(
                              onChanged: (text) => controller.updateName(text),

                              controller:
                                  TextEditingController(text: "John Doe"),
                              focusNode: FocusNode(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black.withOpacity(1)),
                              cursorColor: Colors.blue,
                              backgroundCursorColor: Colors.grey,
                           
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(),
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 3.h),
                                child: Text(
                                  "\$",
                                  style: TextStyle(
                                      fontSize: 25.sp, color: Colors.black),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 7.h),
                                width: 200.w,
                                child: TextField(
                                  onChanged: (text) => controller.updateAmount(text),

                                  autofocus: true,
                                  cursorColor: Colors.black,
                                  cursorWidth: 0.5,
                                  decoration: InputDecoration(
                                      filled: false,
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.zero,
                                      focusedBorder: InputBorder.none),
                                  style: TextStyle(
                                      fontSize: 20.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                              )
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 2.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.r),
                                border: Border.all(color: Colors.black)),
                            child: Row(
                              children: [
                                Text(
                                  "USD",
                                  style: TextStyle(
                                      fontSize: 7.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 10.h,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 4.w),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(children: [
                              Icon(
                                Icons.calendar_today,
                                size: 12.sp,
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              InkWell(
                                onTap: () async {
                                  final date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                  );
                                  if (date != null) {
                                    // Handle selected date
                                  }
                                },
                                child: Text(
                                  'Select Date',
                                  style: TextStyle(
                                    fontSize: 8.sp,
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.h, horizontal: 4.w),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(children: [
                              Icon(Icons.access_time),
                              SizedBox(
                                width: 4.w,
                              ),
                              InkWell(
                                onTap: () async {
                                  final time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  );
                                  if (time != null) {
                                    // Handle selected time
                                  }
                                },
                                child: Text(
                                  'Select Time',
                                  style: TextStyle(
                                    fontSize: 8.sp,
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 40.h, // Adjust height as needed
                    alignment: Alignment.center,
                    child: TextField(
                      onChanged: (text) => controller.updateMessage(text),

                        textAlignVertical: TextAlignVertical.center,
                        style: TextStyle(fontSize: 8.sp),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Add a message',
                            hintStyle: TextStyle(
                                color: Colors.black26, fontSize: 8.sp),
                            fillColor: Colors.grey.withOpacity(0.15),
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 6.w, vertical: 5.h),
                            isDense: true,
                            alignLabelWithHint: true)),
                  )),
                  SizedBox(
                    width: 7.w,
                  ),
                  GestureDetector(
                      onTap: () {
    print('Name: ${controller.name.value}');
    print('Amount: ${controller.amount.value}');
    print('Currency: ${controller.currency.value}');
    print('Date: ${controller.formattedDate}');
    print('Time: ${controller.formattedTime}');
    print('Message: ${controller.message.value}');
  },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 40.w),
                      // width: double.maxFinite,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 8.sp,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}