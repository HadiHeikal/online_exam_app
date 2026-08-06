import 'package:equatable/equatable.dart';

class AnswersEntity extends Equatable {
  final String answerText;
  final String answerKey;

  const AnswersEntity({required this.answerText, required this.answerKey});

  AnswersEntity copyWith({String? answerText, String? answerKey}) {
    return AnswersEntity(
      answerText: answerText ?? this.answerText,
      answerKey: answerKey ?? this.answerKey,
    );
  }

  @override
  List<Object?> get props => [answerText, answerKey];

  @override
  String toString() {
    return 'AnswersEntity(answerText: $answerText, answerKey: $answerKey)';
  }
}
