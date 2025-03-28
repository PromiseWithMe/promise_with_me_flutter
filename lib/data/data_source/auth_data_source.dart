import 'package:dio/dio.dart';
import 'package:promise_with_me_flutter/data/dto/auth/request/register_request.dart';
import 'package:promise_with_me_flutter/data/dto/auth/response/token_response.dart';
import 'package:promise_with_me_flutter/domain/entity/auth/token_response_entity.dart';

import '../dto/auth/request/login_request.dart';

class AuthDataSource {
  Future<TokenResponseEntity> login({
    required LoginRequest loginRequest,
  }) async {
    await Future.delayed(const Duration(seconds: 3), () {});

    print(loginRequest.toJson());

    return TokenResponse.fromJson({
      "accessToken": "eyAccessToken",
      "refreshToken": "eyRefreshToken",
    }).toEntity();
  }

  Future<TokenResponseEntity> register({
    required RegisterRequest registerRequest,
  }) async {
    await Future.delayed(const Duration(seconds: 3), () {});

    print(registerRequest.toJson());

    return TokenResponse.fromJson({
      "accessToken": "eyAccessToken",
      "refreshToken": "eyRefreshToken",
    }).toEntity();
  }
}
