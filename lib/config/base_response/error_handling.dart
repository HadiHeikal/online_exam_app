import 'package:dio/dio.dart';
import 'package:online_exam_app/config/error_model/error_model.dart';

class ErrorHandling {

   static ErrorModel handle(DioException dioException) {
    if (dioException.type == DioExceptionType.badResponse) {
      try {
        return ErrorModel.fromJson(dioException.response!.data);
      } catch (_) {
        return ErrorModel(message: 'unexpected error', code: 0);
      }
    }
    return ErrorModel(message: 'make sure you are online', code: 0);
  }


}