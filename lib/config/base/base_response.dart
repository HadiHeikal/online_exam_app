// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:online_exam_app/config/error/handel_error_exception.dart';

sealed class BaseResponse<T> {
  BaseResponse();
}

class SuccessResponse<T> extends BaseResponse<T> {
  final T data;
  SuccessResponse(this.data);
}

class ErrorResponse<T> extends BaseResponse<T> {
  Exception error;
  String errorMessage;

  ErrorResponse(this.error)
    : errorMessage = HandelErrorException().handelErrorexception(error);
}
