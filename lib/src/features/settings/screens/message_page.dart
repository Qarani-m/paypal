import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:paypal/src/features/settings/controllers/conversation_controller.dart';
import 'package:paypal/src/features/settings/models/messages_model.dart';

class PayPalAssistantPage extends GetView<ConversationController> {
  PayPalAssistantPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    if (args == null) {
      // Handle case when no arguments were passed
      return Scaffold(
        body: Center(
          child: Text('No conversation data'),
        ),
      );
    }
    List<String> starterMessages = [
      'Hi, Damian! Thanks for being a valuable customer of\PayPal',
      'I\'m your PayPal Assistant and always here tohelp, I\'m\nstillin beta testing, so talking to you helps me learn',
      'What can i help you with?'
    ];
    final conversation = args['conversation'] as Conversation;

    print(conversation);

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
body: SingleChildScrollView(
  child: SizedBox(
    height: MediaQuery.of(context).size.height,
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        
  
  
  
  
  
  
  
  
  
  
  Column(
                children: [
              
                  Column(
                    children: [
                      Container(
                        // color: Colors.green,
                        child: Column(
                          children: [
                            Divider(
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            // Header section
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 16.w, left: 16.w, right: 16.w),
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
                          ],
                        ),
                      ),
                                  
                                  
                                  
                                  
                      // Chat messages
                      Obx(()=> Container(
                          color:Colors.blue,
                          height: MediaQuery.of(context).size.height*0.73,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 13.w),
                            child: Column(
                              // padding: EdgeInsets.symmetric(horizontal: 16.w),
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                      // height: 300.h,
                                      color: Colors.red,
                                      child: Column(children: [
                                        Column(
                                          children: List.generate(
                                              starterMessages.length,
                                              (index) => ChatBubble(
                                                    message: starterMessages[index],
                                                    isUser: false,
                                                  )),
                                        ),
                                        SizedBox(
                                          height: 14.h,
                                        ),
                                        SizedBox(
                                          height: 14.h,
                                        ),
                                        Text(controller.placeHolder.value, style: TextStyle(fontSize: 0),),
                                        SingleChildScrollView(
                                          child: Column(
                                            children: List.generate(
                                                conversation.messages.length, (index) {
                                              return ChatBubble(
                                                message:
                                                    conversation.messages[index].content,
                                                isUser: !conversation
                                                    .messages[index].isFromSupport,
                                              );
                                            }),
                                          ),
                                        ),
                                      ])),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
        Container(
          padding: EdgeInsets.only(bottom: 8.w, top: 4.h, right: 10.w),
          decoration: BoxDecoration(
            color: Colors.red,
            border: Border(
              top: BorderSide(
                color: Colors.grey[200]!,
                width: 1,
              ),
            ),
          ),
          child: MessageArea(controller: controller, conversation: conversation),
        ),
      ],
    ),
  ),
)
    );
  }
}

class MessageArea extends StatelessWidget {
  const MessageArea({
    super.key,
    required this.controller,
    required this.conversation,
  });

  final ConversationController controller;
  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          controller.isTyping.value
              ? SizedBox()
              : IconButton(
                  icon: Icon(
                      size: 13.h, Icons.menu, color: Colors.grey),
                  onPressed: () {},
                ),
          SizedBox(width: controller.isTyping.value ? 16.w : 0.w),
          Expanded(
            child: TextField(
              cursorColor: Colors.black,
              cursorHeight: 10.h,
              style: TextStyle(fontSize: 9.sp),
              controller: controller.messageController,
              decoration: InputDecoration(
                suffixIcon: !controller.isTyping.value
                    ? SizedBox()
                    : Padding(
                        padding: EdgeInsets.all(5.r),
                        child: GestureDetector(
                          onTap: () {
                            controller.saveMessage(conversation.id!);
                            controller.messageController.text = '';
                          },
                          child: CircleAvatar(
                              radius: 4.r,
                              child: Icon(
                                Icons.arrow_upward,
                                color: Colors.white,
                                size: 15.w,
                              )),
                        ),
                      ),
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
              onChanged: (value) {
                if (value.length == 0) {
                  controller.isTyping.value = false;
                } else {
                  controller.isTyping.value = true;
                }
              },
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
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: isUser ? Colors.black.withOpacity(1) : Colors.grey[100],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
              bottomLeft: Radius.circular(isUser ? 10.r : 0),
              bottomRight: Radius.circular(isUser ? 0.r : 10)),
        ),
        child: Text(
          message,
          style: TextStyle(
            fontSize: 7.sp,
            color: isUser ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
