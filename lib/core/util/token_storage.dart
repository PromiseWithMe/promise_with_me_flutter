import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:promise_with_me_flutter/core/util/env_values.dart';

AndroidOptions _getAndroidOptions() =>
    const AndroidOptions(encryptedSharedPreferences: true);

class TokenStorage {
  static final _tokenStorage = FlutterSecureStorage(
    aOptions: _getAndroidOptions(),
  );

  static Future<void> writeAccessToken({required String accessToken}) async {
    debugPrint("[ACCESS TOKEN] : $accessToken");

    return await _tokenStorage.write(
      key: EnvValues.accessTokenStorage,
      value: accessToken,
    );
  }

  static Future<void> writeRefreshToken({required String refreshToken}) async {
    debugPrint("[REFRESH TOKEN] : $refreshToken");

    return await _tokenStorage.write(
      key: EnvValues.refreshTokenStorage,
      value: refreshToken,
    );
  }

  static Future<void> writeDeviceToken({required String deviceToken}) async {
    debugPrint("[DEVICE TOKEN] : $deviceToken");

    return await _tokenStorage.write(
      key: EnvValues.deviceTokenStorage,
      value: deviceToken,
    );
  }

  static Future<String?> findAccessToken() async {
    return await _tokenStorage.read(key: EnvValues.accessTokenStorage);
  }

  static Future<String?> findRefreshToken() async {
    return await _tokenStorage.read(key: EnvValues.refreshTokenStorage);
  }

  static Future<String?> findDeviceToken() async {
    return await _tokenStorage.read(key: EnvValues.deviceTokenStorage);
  }
}
