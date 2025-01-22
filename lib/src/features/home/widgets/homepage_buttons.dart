import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomepageButtonContainer extends StatelessWidget {
  const HomepageButtonContainer({
    super.key,
    required this.textRight,
    required this.textLeft,
  });

  final String textRight;
  final String textLeft;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      height: 30.h,
      width: double.maxFinite,
      color: Colors.white,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xFF000000),
                borderRadius: BorderRadius.circular(40.r)),
            width: 150.w,
            child: Text(
              textLeft,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  fontSize: 16.sp),
            ),
          ),
          Spacer(),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color(0xFF000000),
                borderRadius: BorderRadius.circular(40.r)),
            width: 150.w,
            child: Text(
              textRight,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  fontSize: 16.sp),
            ),
          )
        ],
      ),
    );
  }
}
