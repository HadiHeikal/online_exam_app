import 'package:equatable/equatable.dart';
import 'package:online_exam_app/features/exam/domain/entities/exam_entity.dart';

class ExamAttemptEntity extends Equatable {
  final String attemptId;
  final String subject;
  final DateTime completedAt;
  final Duration timeTaken;
  final ExamEntity exam;

  const ExamAttemptEntity({
    required this.attemptId,
    required this.subject,
    required this.completedAt,
    required this.timeTaken,
    required this.exam,
  });

  @override
  List<Object?> get props => [
    attemptId,
    subject,
    completedAt,
    timeTaken,
    exam,
  ];

  @override
  String toString() {
    return 'ExamAttemptEntity(attemptId: $attemptId, subject: $subject, completedAt: $completedAt, timeTaken: $timeTaken, exam: $exam)';
  }
}
