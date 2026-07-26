import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/auth/data/data_source/local/auth_local_data_source.dart';


@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  FlutterSecureStorage flutterSecureStorage;

  AuthLocalDataSourceImpl({required this.flutterSecureStorage});

  static const String tokenKeyApp = 'Token Key';

  @override
  Future<void> saveToken(String token) async {
    await flutterSecureStorage.write(key: tokenKeyApp, value: token);
  }

  @override
  Future<String?> getToken() async {
    return await flutterSecureStorage.read(key: tokenKeyApp);
  }

  @override
  Future<void> clearToken() async {
    return await flutterSecureStorage.delete(key: tokenKeyApp);
  }
}
