class MessageEntity {
  final String message;
  final String? info;

  MessageEntity({
    required this.message,
    this.info,
  });

  @override
  String toString() {
    return 'MessageEntity(message: $message, info: $info)';
  }
}
