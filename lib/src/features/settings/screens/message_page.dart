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
'If i can\'t then i\'ll try to transfer you to Customer Support Agent'
    ];
    // final conversation = args['conversation'] as Conversation;

    // Conversation conversation =  controller.loadConversation(conversation.id!);
    controller.isFromSupport.value = false;

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
            Obx(
              () => Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: Color(
                    controller.isFromSupport.value
                        ? 0xFFDC143C
                        : controller.isInformatory.value
                            ? 0xFF000000 // Example default color (Black)
                            : 0xFF3F20BC,
                  ),
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
            ),
          ],
        ),
        centerTitle: true,
      ),

      body: FutureBuilder<Conversation>(
        future: controller.loadConversation(args['conversation'].id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final conversation = snapshot.data!;
            return MainBody(
                starterMessages: starterMessages,
                controller: controller,
                conversation: conversation);
          }
          return Center(child: CircularProgressIndicator());
        },
      ),

// body:
    );
  }
}

class MainBody extends StatelessWidget {
  const MainBody({
    super.key,
    required this.starterMessages,
    required this.controller,
    required this.conversation,
  });

  final List<String> starterMessages;
  final ConversationController controller;
  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TopPart(
              controller: controller,
              starterMessages: starterMessages,
              conversation: conversation,
            ),
          ),

          //
          Container(
            padding: EdgeInsets.only(bottom: 8.w, top: 4.h, right: 10.w),
            decoration: BoxDecoration(
              // color: Colors.red,
              border: Border(
                top: BorderSide(
                  color: Colors.grey[200]!,
                  width: 1,
                ),
              ),
            ),
            child:
                MessageArea(controller: controller, conversation: conversation),
          ),
        ],
      ),
    );
  }
}

class TopPart extends StatelessWidget {
  const TopPart({
    super.key,
    required this.controller,
    required this.starterMessages,
    required this.conversation,
  });

  final ConversationController controller;
  final List<String> starterMessages;
  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header section - Keep this fixed
        Container(
          child: Column(
            children: [
              Divider(
                color: Colors.grey.withOpacity(0.2),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.w, left: 16.w, right: 16.w),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 130.w),
                      child: GestureDetector(
                        onTap: () => controller.isFromSupport.value =
                            !controller.isFromSupport.value,
                        onDoubleTap: () => controller.isInformatory.value =
                            !controller.isInformatory.value,
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

        // Chat messages - Make this scrollable
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: List.generate(
                        starterMessages.length,
                        (index) => ChatBubble(
                              message: starterMessages[index],
                              isUser: false,
                            )),
                  ),
                  SizedBox(height: 14.h),
                  SizedBox(height: 14.h),
                  Text(
                    controller.placeHolder.value,
                    style: TextStyle(fontSize: 0),
                  ),
                  Obx(()=> Column(
                              children: List.generate(
                                  conversation.messages.length, (index) {
                                return ChatBubble(
                                    seemHolder: controller.seemHolder.value,
                                    isInfor: controller.currentConversation.value!
                                        .messages[index].content
                                        .contains('/////'),
                                    message: controller.currentConversation.value!
                                        .messages[index].content.replaceAll('//', '\n')
                                        .split('/////')[0],
                                    isUser: !controller.currentConversation.value!
                                        .messages[index].isFromSupport);
                              }),
                            ),
                  )
                    
                
                ],
              ),
            ),
          ),
        ),
      ],
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
                  icon: Icon(size: 13.h, Icons.menu, color: Colors.grey),
                  onPressed: () {},
                ),
          SizedBox(width: controller.isTyping.value ? 16.w : 0.w),
          Expanded(
            child: TextField(
              // cursorColor: Colors.black,
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
                            controller.placeHolder.value =
                                DateTime.now().toString();
                            controller.loadConversation(conversation.id!);
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
  final bool isInfor;
  final bool seemHolder;

  const ChatBubble({
    required this.message,
    required this.isUser,
    super.key,
    this.seemHolder = false,
    this.isInfor = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      alignment: isInfor
          ? Alignment.center
          : isUser
              ? Alignment.centerRight
              : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 290.w,  // Adjust maxWidth as needed
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: 10.w, vertical: isInfor ? 5.h : 10.h),
          decoration: BoxDecoration(
            color: isInfor
                ? Colors.transparent
                : isUser
                    ? Colors.black.withOpacity(1)
                    : Colors.grey[100],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
                bottomLeft: Radius.circular(isUser ? 10.r : 0),
                bottomRight: Radius.circular(isUser ? 0.r : 10)),
          ),
          child: Text(
            message,
            style: TextStyle(
              fontSize: 8.5.sp,
              color: isInfor
                  ? Colors.black
                  : isUser
                      ? Colors.white
                      : Colors.black,
            ),
            softWrap: true,  // Ensure text wraps to the next line
            overflow: TextOverflow.visible,  // Prevent text overflow
          ),
        ),
      ),
    );
  }
}
