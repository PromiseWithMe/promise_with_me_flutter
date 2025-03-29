import 'package:promise_with_me_flutter/core/util/dio.dart';
import 'package:promise_with_me_flutter/data/dto/auth/request/register_request.dart';
import 'package:promise_with_me_flutter/domain/entity/auth/token_response_entity.dart';

import '../dto/auth/request/login_request.dart';

class AuthDataSource {
  Future<TokenResponseEntity> login({
    required LoginRequest loginRequest,
  }) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: loginRequest.toJson(),
      );
      return TokenResponseEntity.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }

  Future<TokenResponseEntity> register({
    required RegisterRequest registerRequest,
  }) async {
    try {
      final response = await dio.post(
        '/auth/register',
        data: registerRequest.toJson(),
      );
      return TokenResponseEntity.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }
}
