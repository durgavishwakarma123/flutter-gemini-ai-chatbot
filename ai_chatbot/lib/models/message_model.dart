class MessageModel {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  MessageModel({
    required this.text,
    required this.isUser,
    required this.timestamp,
  });
}
