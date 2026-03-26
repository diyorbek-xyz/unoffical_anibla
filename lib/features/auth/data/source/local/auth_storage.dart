import 'package:application/core/resources/storage_keys.dart';
import 'package:application/features/auth/data/models/login_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AuthStorage {
  Future<void> saveTokens(TokensModel tokens);
  Future<void> saveAccessToken(String accessToken);
  Future<void> saveRefreshToken(String refreshToken);
  Future<void> removeToken(String key);
  Future<void> clearTokens();
  Future<TokensModel?> getTokens();
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
}

class AuthStorageImpl implements AuthStorage {
  final FlutterSecureStorage storage;
  const AuthStorageImpl(this.storage);

  @override
  Future<void> saveTokens(TokensModel tokens) async {
    await storage.write(key: StorageKeys.accessToken, value: tokens.accessToken);
    await storage.write(key: StorageKeys.refreshToken, value: tokens.refreshToken);
  }

  @override
  Future<void> saveAccessToken(String accessToken) async {
    await storage.write(key: StorageKeys.accessToken, value: accessToken);
  }

  @override
  Future<void> saveRefreshToken(String refreshToken) async {
    await storage.write(key: StorageKeys.refreshToken, value: refreshToken);
  }

  @override
  Future<TokensModel?> getTokens() async {
    final accessToken = await storage.read(key: StorageKeys.accessToken);
    final refreshToken = await storage.read(key: StorageKeys.refreshToken);
    if (accessToken == null || refreshToken == null) return null;
    return TokensModel(accessToken: accessToken, refreshToken: refreshToken);
  }

  @override
  Future<String?> getAccessToken() async {
    return await storage.read(key: StorageKeys.accessToken);
  }

  @override
  Future<String?> getRefreshToken() async {
    return await storage.read(key: StorageKeys.refreshToken);
  }

  @override
  Future<void> removeToken(String key) async {
    await storage.delete(key: key);
  }

  @override
  Future<void> clearTokens() async {
    await storage.delete(key: StorageKeys.accessToken);
    await storage.delete(key: StorageKeys.refreshToken);
  }
}
