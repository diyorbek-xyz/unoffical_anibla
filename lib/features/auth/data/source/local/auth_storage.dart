import 'package:application/core/resources/storage_keys.dart';
import 'package:application/features/auth/data/models/login_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AuthStorage {
  Future<void> saveAniblaTokens(TokensModel tokens);
  Future<void> saveManoTokens(TokensModel tokens);
  Future<void> clearAniblaTokens();
  Future<void> clearManoTokens();
  Future<TokensModel?> getAniblaTokens();
  Future<TokensModel?> getManoTokens();
}

class AuthStorageImpl implements AuthStorage {
  final FlutterSecureStorage storage;
  const AuthStorageImpl(this.storage);

  @override
  Future<void> saveAniblaTokens(TokensModel model) async {
    await storage.write(key: StorageKeys.aniblaAccess, value: model.accessToken);
    await storage.write(key: StorageKeys.aniblaRefresh, value: model.refreshToken);
  }

  @override
  Future<void> saveManoTokens(TokensModel model) async {
    await storage.write(key: StorageKeys.manoAccess, value: model.accessToken);
    await storage.write(key: StorageKeys.manoRefresh, value: model.refreshToken);
  }

  @override
  Future<void> clearAniblaTokens() async {
    await storage.delete(key: StorageKeys.aniblaAccess);
    await storage.delete(key: StorageKeys.aniblaRefresh);
  }

  @override
  Future<void> clearManoTokens() async {
    await storage.delete(key: StorageKeys.manoAccess);
    await storage.delete(key: StorageKeys.manoRefresh);
  }

  @override
  Future<TokensModel?> getManoTokens() async {
    final access = await storage.read(key: StorageKeys.manoAccess);
    final refresh = await storage.read(key: StorageKeys.manoRefresh);
    if (access == null || refresh == null) return null;
    return TokensModel(accessToken: access, refreshToken: refresh);
  }

  @override
  Future<TokensModel?> getAniblaTokens() async {
    final access = await storage.read(key: StorageKeys.aniblaAccess);
    final refresh = await storage.read(key: StorageKeys.aniblaRefresh);
    if (access == null || refresh == null) return null;
    return TokensModel(accessToken: access, refreshToken: refresh);
  }
}
