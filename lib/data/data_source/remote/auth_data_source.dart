import 'package:promise_with_me_flutter/core/util/dio.dart';
import 'package:promise_with_me_flutter/data/dto/auth/register_request.dart';
import 'package:promise_with_me_flutter/domain/entity/auth/token_response_entity.dart';

import '../../dto/auth/login_request.dart';

class AuthDataSource {
  Future<TokenResponseEntity> login({
    required LoginRequest loginRequest,
  }) async {
    final request = loginRequest.toRequest();

    try {
      final response = await dio.post('/auth/login', data: request.data);
      return TokenResponseEntity.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }

  Future<TokenResponseEntity> register({
    required RegisterRequest registerRequest,
  }) async {
    final request = registerRequest.toRequest();

    try {
      final response = await dio.post('/auth/register', data: request.data);
      return TokenResponseEntity.fromJson(response.data);
    } catch (err) {
      rethrow;
    }
  }
}
