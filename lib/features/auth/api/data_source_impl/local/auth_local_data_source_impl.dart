import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/features/auth/data/data_source/local/auth_local_data_source.dart';

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage _secureStorage;

  AuthLocalDataSourceImpl(this._secureStorage);

  static const String _tokenKey = 'auth_token';

  @override
  Future<void> saveToken(String token) {
    return _secureStorage.write(key: _tokenKey, value: token);
  }

  @override
  Future<String?> getToken() {
    return _secureStorage.read(key: _tokenKey);
  }

  @override
  Future<void> clearToken() {
    return _secureStorage.delete(key: _tokenKey);
  }
}
