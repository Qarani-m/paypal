import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paypal/src/constants/images.dart';
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
        title: GestureDetector(
          onDoubleTap: () =>
              controller.showOther.value = !controller.showOther.value,
          child: Text(
            "Amount",
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 8.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(1)),
          ),
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
                // color: Colors.red,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: controller.pickImage,
                          child: Obx(() => CircleAvatar(
                                backgroundImage: controller.imageFile != null
                                    ? FileImage(controller.imageFile!)
                                    : AssetImage(AppImages.atmCard)
                                        as ImageProvider,
                                radius: 18.r,
                              )),
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
                              cursorColor: Color(0xFF0059b3),
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
                                  keyboardType: TextInputType.number,
                                  onChanged: (text) =>
                                      controller.updateAmount(text),
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
                                  controller.currency.value,
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
                      height: 6.h,
                    ),

                    Obx(
                      () => controller.showOther.value
                          ? Column(
                              children: [
                                Container(
                                  // color: Colors.red,
                                  // height: 40.h, // Adjust height as needed
                                  alignment: Alignment.center,
                                  child: TextField(
                                              keyboardType: TextInputType.emailAddress,

                                      onChanged: (text) =>
                                          controller.updateEmail(text),
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      style: TextStyle(fontSize: 8.sp),
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            borderSide: BorderSide.none,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            borderSide: BorderSide.none,
                                          ),
                                          hintText: 'Add email',
                                          hintStyle: TextStyle(
                                              color: Colors.black26,
                                              fontSize: 8.sp),
                                          fillColor:
                                              Colors.grey.withOpacity(0.15),
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 6.w, vertical: 5.h),
                                          isDense: true,
                                          alignLabelWithHint: true)),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      // color: Colors.red,
                                      width: 140.h, // Adjust height as needed
                                      alignment: Alignment.center,
                                      child: TextField(
                                              keyboardType: TextInputType.number,

                                          onChanged: (text) => controller
                                              .updateExchangeRate(text),
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          style: TextStyle(fontSize: 8.sp),
                                          decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                borderSide: BorderSide.none,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                borderSide: BorderSide.none,
                                              ),
                                              hintText: 'Exchange rate',
                                              hintStyle: TextStyle(
                                                  color: Colors.black26,
                                                  fontSize: 8.sp),
                                              fillColor:
                                                  Colors.grey.withOpacity(0.15),
                                              filled: true,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 6.w,
                                                      vertical: 5.h),
                                              isDense: true,
                                              alignLabelWithHint: true)),
                                    ),
                                    Container(
                                      // color: Colors.red,
                                      width: 140.h, // Adjust height as needed
                                      alignment: Alignment.center,
                                      child: TextField(
                                          onChanged: (text) =>
                                              controller.updatePaypalFee(text),
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                              keyboardType: TextInputType.number,
                                          style: TextStyle(fontSize: 8.sp),
                                          decoration: InputDecoration(
                                            
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                borderSide: BorderSide.none,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                borderSide: BorderSide.none,
                                              ),
                                              hintText: 'Paypal Fee',
                                              hintStyle: TextStyle(
                                                  color: Colors.black26,
                                                  fontSize: 8.sp),
                                              fillColor:
                                                  Colors.grey.withOpacity(0.15),
                                              filled: true,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 6.w,
                                                      vertical: 5.h),
                                              isDense: true,
                                              alignLabelWithHint: true)),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 7.h,
                                ),

                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.h, horizontal: 4.w),
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                                controller.updateDate(date);
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
                                          border:
                                              Border.all(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                                controller.updateTime(time);
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
                                ),

                                SizedBox(
                                  height: 8.h,
                                ),
                                // ==========================================================

                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Send to:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w700,
                                          )),
                                ),

                                SizedBox(
                                  height: 8.h,
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                      3,
                                      (index) => GestureDetector(
                                            onTap: () => controller
                                                .updateSelectedTab(index),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: controller.selectedTab
                                                              .value ==
                                                          index
                                                      ? const Color.fromARGB(
                                                          255, 4, 78, 138)
                                                      : Colors.grey
                                                          .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.r)),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.h,
                                                  horizontal: 20.h),
                                              child: Text(
                                                  controller.actions[index],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                        fontSize: 8.sp,
                                                        color: controller
                                                                    .selectedTab
                                                                    .value ==
                                                                index
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                            ),
                                          )),
                                ),

                                SizedBox(
                                  height: 8.h,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Paypal:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w700,
                                          )),
                                ),

                                SizedBox(
                                  height: 8.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: List.generate(
                                      2,
                                      (index) => GestureDetector(
                                            onTap: () => controller
                                                .updateSelectedTab(index + 3),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: controller.selectedTab
                                                              .value ==
                                                          index + 3
                                                      ? const Color.fromARGB(
                                                          255, 4, 78, 138)
                                                      : Colors.grey
                                                          .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.r)),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.h,
                                                  horizontal: 20.h),
                                              child: Text(
                                                  controller.actions[index + 3],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                        fontSize: 8.sp,
                                                        color: controller
                                                                    .selectedTab
                                                                    .value ==
                                                                index + 3
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                            ),
                                          )),
                                ),

                                SizedBox(
                                  height: 8.h,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('Recieved from',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight.w700,
                                          )),
                                ),

                                SizedBox(
                                  height: 8.h,
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: List.generate(
                                      2,
                                      (index) => GestureDetector(
                                            onTap: () => controller
                                                .updateSelectedTab(index + 5),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: controller.selectedTab
                                                              .value ==
                                                          index + 5
                                                      ? const Color.fromARGB(
                                                          255, 4, 78, 138)
                                                      : Colors.grey
                                                          .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.r)),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.h,
                                                  horizontal: 20.h),
                                              child: Text(
                                                  controller.actions[index + 5],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall
                                                      ?.copyWith(
                                                        fontSize: 8.sp,
                                                        color: controller
                                                                    .selectedTab
                                                                    .value ==
                                                                index + 5
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )),
                                            ),
                                          )),
                                ),
                              ],
                            )
                          : Center(),
                    ),

// ==========================================================
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
                      controller.savePayment();
                      print(
                          'Selected: ${controller.selectedTab.value},${controller.actions[controller.selectedTab.value]}');
                    },
                    // onTap: () {
                    //   print('Name: ${controller.name.value}');
                    //   print('Amount: ${controller.amount.value}');
                    //   print('Currency: ${controller.currency.value}');
                    //   print('Date: ${controller.formattedDate}');
                    //   print('Time: ${controller.formattedTime}');
                    //   print('Message: ${controller.message.value}');
                    //   print('Email: ${controller.email.value}');
                    //   print('exchangeRate: ${controller.exchangeRate.value}');
                    //   print('Paypal Fee: ${controller.payPalFee.value}');
                    //   print('Selected: ${controller.selectedTab.value},${controller.actions[controller.selectedTab.value]}');
                    // },
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
