import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/constants/api_stings.dart';
import 'package:online_exam_app/features/auth/data/data_source/local/auth_local_data_source.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio dio(AuthLocalDataSource authLocalDataSource) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiStrings.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
    dio.interceptors.add(AuthInterceptors(authLocalDataSource));
    return dio;
  }
}

class AuthInterceptors extends Interceptor {
  final AuthLocalDataSource authLocalDataSource;
  AuthInterceptors(this.authLocalDataSource);
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String? token = await authLocalDataSource.getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }
}

// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:online_exam_app/features/auth/data/data_source/local/auth_local_data_source.dart';

// @module


// class DioModule {
// @lazySingleton

// Dio dio(AuthLocalDataSource authLocalDataSource) {
//   final dio = Dio(
//     BaseOptions(
//       baseUrl: ApiStrings.baseUrl,
//       connectTimeout: const Duration(seconds: 10),
//       receiveTimeout: const Duration(seconds: 10),
//     ),
//   );
//   dio.interceptors.add(InterceptorsWrapper(
//     onRequest: (RequestOptions options, handler) async {
      
//       String? token =await authLocalDataSource.getToken();
//       if (token != null) {
//         options.headers['token'] = token;
//       }
//       handler.next(options);
//     }
//   ));
//   return dio;
// }
// }