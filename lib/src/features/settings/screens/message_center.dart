import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:paypal/src/constants/images.dart';
import 'package:paypal/src/features/settings/screens/message_page.dart';

class MessageCenter extends StatelessWidget {
  const MessageCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 12.sp), // Adjust size here
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Message Centre",
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 8.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(1)),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding:
                EdgeInsets.only(left: 10.w, right: 10.w, top: 3.h, bottom: 5.h),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Need help?",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 6.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(1)),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "Ask PayPal assistant",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 7.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0059b3).withOpacity(1)),
                    ),
                  ],
                ),
                SizedBox(
                  width: 9.w,
                ),
                SvgPicture.asset(
                  AppImages.onlinePurchases,
                  height: 10.h,
                )
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          GestureDetector(
            
            onTap: () => Get.to(PayPalAssistantPage()),
            child: OneMessage()),
          OneMessage(),
          OneMessage(),
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 3.h),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Effective from 1 january 2023, messages are availlable in the Message Centre for 3 years from the daate originally sent. If you would like a copy of any previous messages not displayedin the Message Centre, please ',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 6.sp,
                          fontWeight: FontWeight.w200,
                          color: Colors.black.withOpacity(1),
                        ),
                  ),
                  TextSpan(
                    text: 'contact us',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 6.sp,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFF0059b3),
                          color:
                              Color(0xFF0059b3), // Different color for the link text
                        ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OneMessage extends StatelessWidget {
  const OneMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 3.h),
          child: Container(
            padding:
                EdgeInsets.only(left: 10.w, right: 10.w, top: 8.h, bottom: 8.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  AppImages.onlinePurchases,
                  height: 10.h,
                ),
                SizedBox(
                  width: 7.w,
                ),
                Expanded(
                  // Add this to allow text to take remaining width
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to start
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Customer Support',
                            maxLines: 3, // Limit to 3 lines
                            overflow: TextOverflow
                                .ellipsis, // Add ellipsis when overflowing
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 6.7.sp,
                                      height:
                                          1.5, // Line height for better readability
                                    ),
                          ),
                          Text(
                            '5:59 pm',
                            maxLines: 3, // Limit to 3 lines
                            overflow: TextOverflow
                                .ellipsis, // Add ellipsis when overflowing
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 5.7.sp,
                                      color: Colors.black.withOpacity(0.7),
                                      height:
                                          1.5, // Line height for better readability
                                    ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        "This star communicator is ruled by Mercury, the planet that governs — of course — communication. Virgo, another Mercury-ruled sign, is more about precision with words, whereas Gemini uses words to create a sense of magic and enchantment. They will delight all who they come across and use their charm to extract the most important thing of all: Information.",
                        maxLines: 3, // Limit to 3 lines
                        overflow: TextOverflow
                            .ellipsis, // Add ellipsis when overflowing
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 6.7.sp,
                              height: 1.5, // Line height for better readability
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 6.h,
        )
      ],
    );
  }
}
