import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final String message;
  final String? info;

  const MessageEntity({required this.message, this.info});

  @override
  List<Object?> get props => [message, info];

  @override
  String toString() {
    return 'MessageEntity(message: $message, info: $info)';
  }
}
