import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paypal/src/features/settings/controllers/conversation_controller.dart';

class PayPalAssistantPage extends GetView<ConversationController> {
    PayPalAssistantPage({super.key});



  final messages = Get.arguments['conversation'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
                leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 12.sp), // Adjust size here
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
 
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'PayPal Assistant',
              style: TextStyle(
                color: Colors.black,
                fontSize: 8.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 8.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: Color(0xFF3f20bc),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Text(
                'beta',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 6.5.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Divider(
            color: Colors.grey.withOpacity(0.2),
          ),
          // Header section
          Padding(
            padding: EdgeInsets.only(top: 16.w, left: 16.w, right: 16.w),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 130.w),
                  child: Column(
                    children: [
                      Text(
                        'Talk to me',
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        "I'm powered by generative AI",
                        style: TextStyle(
                            fontSize: 8.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'We use automated processing of personal data when you interact with this customer service chatbot.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 7.5.sp,
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),

          // Chat messages
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              children: [
                // Timestamp
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    child: Text(
                      'Jan 22 at 08:32 pm',
                      style: TextStyle(
                        fontSize: 7.5.sp,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ),
                ),


                // Assistant messages
                ChatBubble(
                  message:
                      "Hi! I'm your PayPal Assistant and always here to help. I'm still in beta testing, so talking to you helps me learn.",
                  isUser: false,
                ),
                ChatBubble(
                  message:
                      "If I can't then I'll try to transfer you to a Customer Support Agent.",
                  isUser: false,
                ),





                ListView.builder(
  itemCount: messages.length + 2, // +2 for your initial assistant messages
  itemBuilder: (context, index) {
    // Show the initial assistant messages first
    if (index == 0) {
      return ChatBubble(
        message: "Hi! I'm your PayPal Assistant and always here to help. I'm still in beta testing, so talking to you helps me learn.",
        isUser: false,
      );
    } else if (index == 1) {
      return ChatBubble(
        message: "If I can't then I'll try to transfer you to a Customer Support Agent.",
        isUser: false,
      );
    } else {
      // Show the actual conversation messages
      final message = messages[index - 2]; // Subtract 2 to account for initial messages
      return ChatBubble(
        message: message.content,
        isUser: !message.isFromSupport, // Reverse since isUser true means it's from user
      );
    }
  },
)
              ],
            ),
          ),

          // Input field
          Container(
            padding: EdgeInsets.only(bottom: 8.w, top: 4.h,right: 10.w),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey[200]!,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(size: 10.h, Icons.menu, color: Colors.grey),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    cursorColor: Colors.black,
                    cursorHeight: 10.h,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      hintText: 'Enter a message',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 7.sp,
                        height: 2.99,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          color: Colors.grey[300]!,
                          width: 0.3,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.r),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.only(
                        left: 8.w,
                        top: 8.h,
                        bottom: 8.h,
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          color: Color(0xFF0059b3)!,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Chat bubble widget
class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  const ChatBubble({
    required this.message,
    required this.isUser,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isUser ? Color(0xFF0059b3).withOpacity(0.3) : Colors.grey[100],
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          message,
          style: TextStyle(
            fontSize: 7.sp,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
