import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:paypal/src/features/settings/models/messages_model.dart';
import 'package:paypal/src/features/settings/service/messages_dbhelper.dart';

class ConversationController extends GetxController {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  final RxList<Conversation> conversations = <Conversation>[].obs;
  final Rx<Conversation?> currentConversation = Rx<Conversation?>(null);
  final RxList<Message> currentMessages = <Message>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadConversations();
  }

  // Load all conversations
  Future<void> loadConversations() async {
    conversations.value = await _dbHelper.getConversations();
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
  Future<void> loadConversation(int conversationId) async {
    final conversation = await _dbHelper.getConversation(conversationId);
    if (conversation != null) {
      currentConversation.value = conversation;
      currentMessages.value = conversation.messages;
    }
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
}