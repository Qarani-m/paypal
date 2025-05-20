import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paypal/src/constants/images.dart';
import 'package:paypal/src/features/payments/controllers/create_payment.dart';


class CustomTextField extends StatelessWidget {
  final String hintText;
  final Function(String) onChanged;
  final Color containerColor;
  final double? width;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    required this.containerColor,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: containerColor,
        width: width,
        alignment: Alignment.center,
        child: TextField(
          keyboardType: TextInputType.number,
          onChanged: onChanged,
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
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.black26,
              fontSize: 8.sp,
            ),
            fillColor: Colors.grey.withOpacity(0.15),
            filled: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 6.w,
              vertical: 5.h,
            ),
            isDense: true,
            alignLabelWithHint: true,
          ),
        ),
      ),
    );
  }
}


class CustomPickerButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() onTap;
  final double iconSize;

  const CustomPickerButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.iconSize = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 4.w),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: iconSize.sp,
            ),
            SizedBox(width: 4.w),
            InkWell(
              onTap: onTap,
              child: Text(
                text,
                style: TextStyle(fontSize: 8.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}