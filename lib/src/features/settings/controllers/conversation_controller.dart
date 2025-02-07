import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:paypal/src/features/settings/models/messages_model.dart';
import 'package:paypal/src/features/settings/service/messages_dbhelper.dart';

class ConversationController extends GetxController {
  final DatabaseHelperMessages _dbHelper = DatabaseHelperMessages();
  final RxList<Conversation> conversations = <Conversation>[].obs;
  final Rx<Conversation?> currentConversation = Rx<Conversation?>(null);
  final RxList<Message> currentMessages = <Message>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadConversations();
  }


  RxString placeHolder = 'true'.obs;
  RxBool isFromSupport = false.obs;

  // Load all conversations
  Future<void> loadConversations() async {

    // conversations.value = await _dbHelper.getConversations();

    final List<Conversation> conversationMaps =
        await _dbHelper.getConversations();
    List<Conversation> conversationsWithMessages = [];

    for (var convMap in conversationMaps) {
      final messages = await _dbHelper.getMessagesByConversationId(convMap.id!);

      final messageList = messages.map((m) => Message.fromMap(m)).toList();
      conversationsWithMessages.add(Conversation(
          id: convMap.id,
          date: convMap.date,
          time: convMap.time,
          messages: messageList));
    }

    conversations.value = conversationsWithMessages;
  }

  // Start a new conversation
  Future<void> startNewConversation() async {
    final conversation = Conversation(
      date: DateTime.now().toString().split(' ')[0],
      time: DateTime.now().toString().split(' ')[1].substring(0, 5),
      messages: [],
    );

    final id = await _dbHelper.insertConversation(conversation);
    await loadConversations();
    await loadConversation(id);
  }

  // Load a specific conversation
Future<Conversation> loadConversation(int conversationId) async {
  final conversation = await _dbHelper.getConversation(conversationId);
  if (conversation != null) {
    currentConversation.value = conversation;
    currentMessages.value = conversation.messages;
    return conversation;
  }
  throw Exception('Conversation not found');
}

  // Send a new message
  Future<void> sendMessage(String content, bool isFromSupport) async {
    if (currentConversation.value == null) {
      await startNewConversation();
    }

    final message = Message(
      content: content,
      isFromSupport: isFromSupport,
      time: DateTime.now().toString().split(' ')[1].substring(0, 5),
      date: DateTime.now().toString().split(' ')[0],
    );

    await _dbHelper.insertMessage(currentConversation.value!.id!, message);
    await loadConversation(currentConversation.value!.id!);
  }

  // Delete a conversation
  Future<void> deleteConversation(int conversationId) async {
    await _dbHelper.deleteConversation(conversationId);
    await loadConversations();
    if (currentConversation.value?.id == conversationId) {
      currentConversation.value = null;
      currentMessages.clear();
    }
  }

  RxBool isTyping = false.obs;
  TextEditingController messageController = TextEditingController();

  Future<void> saveMessage(int conversationId) async {
    try {
      String message = messageController.text;
      Message messageMap = Message(
        content: messageController.text,
        isFromSupport: isFromSupport.value,
        time: '',
        date: '',
      );

      await _dbHelper.insertMessage(conversationId, messageMap);
      // Get.snackbar('Success', "Message saved successfully");

await      loadConversation(conversationId);
      
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to save message: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print('Error saving message: $e'); // For debugging
    }
  }
}
