import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/exam/data/data_source/local/exam_attempt_local_data_source.dart';
import 'package:online_exam_app/features/exam/data/models/exam_attempt_model.dart';

@LazySingleton(as: ExamAttemptLocalDataSource)
class ExamAttemptLocalDataSourceImpl implements ExamAttemptLocalDataSource {
  final FlutterSecureStorage _secureStorage;

  ExamAttemptLocalDataSourceImpl(this._secureStorage);

  static const String _attemptsKey = 'exam_attempts';

  @override
  Future<void> saveAttempt(ExamAttemptModel attempt) async {
    final attempts = await getAttempts();
    attempts.add(attempt);
    final encoded = jsonEncode(
      attempts.map((attempt) => attempt.toJson()).toList(),
    );
    await _secureStorage.write(key: _attemptsKey, value: encoded);
  }

  @override
  Future<List<ExamAttemptModel>> getAttempts() async {
    final stored = await _secureStorage.read(key: _attemptsKey);
    if (stored == null) return [];

    final decoded = jsonDecode(stored) as List<dynamic>;
    return decoded
        .map(
          (json) => ExamAttemptModel.fromJson(json as Map<String, dynamic>),
        )
        .toList();
  }
}
