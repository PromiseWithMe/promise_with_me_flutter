import 'package:promise_with_me_flutter/data/dto/auth/response/token_response.dart';
import 'package:promise_with_me_flutter/domain/entity/auth/token_response_entity.dart';

import '../dto/auth/request/login_request.dart';

class AuthDataSource {
  Future<TokenResponseEntity> login({
    required LoginRequest loginRequest,
  }) async {
    return TokenResponse.fromJson({
      "accessToken": "eyAccessToken",
      "refreshToken": "eyRefreshToken",
    }).toEntity();
  }
}
