import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShowStory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    radius: 14.r,
                    backgroundColor: Colors.black87,
                    child: Text(
                      'SA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 7.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Sent to text
                  Text(
                    'You sent Samuel Akoli',
                    style: TextStyle(
                      fontSize: 7.sp,
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
                          '\$',
                          style: TextStyle(
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                      Text(
                        '16.00',
                        style: TextStyle(
                          fontSize: 30.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Text(
                          'USD',
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
                    'family',
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
}
