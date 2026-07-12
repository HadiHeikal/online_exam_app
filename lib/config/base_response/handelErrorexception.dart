import 'package:dio/dio.dart';
import 'package:online_exam_app/config/base_response/error_handling.dart';

 class Handelerrorexception {

  String handelErrorexception(Exception error) {
  if (error is DioException) {
    switch (error.type) {
      case DioExceptionType.sendTimeout:
        return 'send timeout';
      case DioExceptionType.connectionTimeout:
        return 'connection timeout';
      case DioExceptionType.receiveTimeout:
        return 'receive timeout';
      case DioExceptionType.badCertificate:
        return 'bad certificate';
      case DioExceptionType.badResponse:
        return ErrorHandling.handle(error).message!;
      case DioExceptionType.cancel:
        return 'request cancelled';
      case DioExceptionType.connectionError:
        return 'connection error';
      case DioExceptionType.unknown:
        return 'unknown';
      case DioExceptionType.transformTimeout:
        return 'transform timeout';
    }
  } else {
    return 'something went wrong, pls try again';
  }
}
}