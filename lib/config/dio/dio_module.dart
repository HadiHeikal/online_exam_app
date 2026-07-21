import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constants/api_stings.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio get dio => Dio(
    BaseOptions(
      baseUrl: ApiStrings.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
}
