// Message Model
class Message {
  final int? id;
  final String content;
  final bool isFromSupport;
  final String time;
  final String date;

  Message({
    this.id,
    required this.content,
    required this.isFromSupport,
    required this.time,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'isFromSupport': isFromSupport ? 1 : 0,
      'time': time,
      'date': date,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'],
      content: map['content'],
      isFromSupport: map['isFromSupport'] == 1,
      time: map['time'],
      date: map['date'],
    );
  }
}

// Conversation Model
class Conversation {
  final int? id;
  final String date;
  final String time;
  final List<Message> messages;

  Conversation({
    this.id,
    required this.date,
    required this.time,
    required this.messages,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'time': time,
    };
  }

  factory Conversation.fromMap(Map<String, dynamic> map, List<Message> messages) {
    return Conversation(
      id: map['id'],
      date: map['date'],
      time: map['time'],
      messages: messages,
    );
  }
}