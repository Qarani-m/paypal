import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:paypal/src/constants/images.dart';
import 'package:paypal/src/features/settings/controllers/conversation_controller.dart';
import 'package:paypal/src/features/settings/models/messages_model.dart';
import 'package:paypal/src/features/settings/screens/message_page.dart';

class MessageCenter extends  GetView<ConversationController> {
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
              fontSize: 9.sp,
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
            child: GestureDetector(
              onTap: (){

controller.startNewConversation();


              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Need help?${controller.conversations.length}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 7.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(1)),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        "Ask PayPal assistant",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 8.sp,
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
                    height: 14.h,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          // GestureDetector(
          //     onTap: () => Get.to(PayPalAssistantPage()), child: OneMessage()),
          // OneMessage(),
         


 Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.conversations.length,
                    itemBuilder: (context, index) {
                      final conversation = controller.conversations[index];
                      return GestureDetector(
                        onTap: (){

                          // Get.
                        },
                        child: OneMessage(
                          conversation: conversation,
                          onTap: () {
                            controller.loadConversation(conversation.id!);
                            // Get.to(() => MessagesView()); // Your existing messages view
                          },
                        ),
                      );
                    },
                  )),
            ),



          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 3.h),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text:
                        'Effective from 1 january 2023, messages are availlable in the Message Centre for 3 years from the daate originally sent. If you would like a copy of any previous messages not displayedin the Message Centre,\nplease ',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 6.5.sp,
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
                          color: Color(
                              0xFF0059b3), // Different color for the link text
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
 final Conversation conversation;
  final VoidCallback onTap;

  const OneMessage({
    required this.conversation,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  String formatTimeAgo(String dateTimeStr) {
    // Parse the input date string
    final DateTime dateTime = DateTime.parse(dateTimeStr.replaceAll(' ', 'T'));
    final DateTime now = DateTime.now();
    final Duration difference = now.difference(dateTime);

    // If less than an hour ago
    if (difference.inHours < 1) {
      return '${difference.inMinutes} mins ago';
    }
    // If it's today but more than an hour ago
    else if (dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day) {
      return DateFormat('h:mma').format(dateTime).toLowerCase();
    }
    // For any other date
    else {
      return DateFormat('d/MM/yyyy').format(dateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 3.h),
          child: Container(
            padding:
                EdgeInsets.only(left: 20.w, right: 10.w, top: 8.h, bottom: 20.h),
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
                                      fontSize: 7.7.sp,
                                      height:
                                          1.5, // Line height for better readability
                                    ),
                          ),
                          Text(
                            formatTimeAgo('${conversation.date} ${conversation.time}'),
                            maxLines: 3, // Limit to 3 lines
                            overflow: TextOverflow
                                .ellipsis, // Add ellipsis when overflowing
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 7.7.sp,
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
                        '',
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
