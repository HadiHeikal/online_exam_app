import 'package:online_exam_app/config/base_response/handel_error_exception.dart';

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
    : errorMessage = Handelerrorexception().handelErrorexception(error);
}
