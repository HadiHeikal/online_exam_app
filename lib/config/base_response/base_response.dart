import 'package:dio/dio.dart';

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
  ErrorResponse(this.error) : errorMessage = handelErrorexception(error);
}
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
        return _extractServerMessage(error);
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

String _extractServerMessage(DioException error) {
  try {
    final data = error.response?.data;
    if (data is Map<String, dynamic> && data['message'] != null) {
      return data['message']; // "username already exists"
    }
    return 'something went wrong, pls try again';
  } catch (_) {
    return 'something went wrong, pls try again';
  }
}

// String handelErrorexception(Exception error) {
//   if (error is DioException) {
//     switch (error.type) {
//       case DioExceptionType.sendTimeout:
//         return 'send timeout';
//       case DioExceptionType.connectionTimeout:
//         return 'connection timeout';
//       case DioExceptionType.receiveTimeout:
//         return 'receive timeout';
//       case DioExceptionType.badCertificate:
//         return 'bad certificate';
//       case DioExceptionType.badResponse:
//         return _handlingErrorofStatusCode(error.response?.statusCode);
//       case DioExceptionType.cancel:
//         return 'request cancelled';
//       case DioExceptionType.connectionError:
//         return 'connection error';
//       case DioExceptionType.unknown:
//         return 'unknown';
//       case DioExceptionType.transformTimeout:
//         return 'transform timeout';
//     }
//   } else {
//     return 'something went wrong, pls try again';
//   }
// }

// String _handlingErrorofStatusCode(int? code) {
//   switch (code) {
//     case 400:
//       return 'bad request';
//     case 401:
//       return 'unauthorized';
//     case 403:
//       return 'forbidden';
//     case 404:
//       return 'not found';
//     case 500:
//       return 'internal server error';
//     case 502:
//       return 'bad gateway';
//     default:
//       return 'something went wrong, pls try again';
//   }
// }
