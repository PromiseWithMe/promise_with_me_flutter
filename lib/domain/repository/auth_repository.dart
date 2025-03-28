import 'package:promise_with_me_flutter/data/dto/auth/request/register_request.dart';
import 'package:promise_with_me_flutter/domain/entity/auth/token_response_entity.dart';

import '../../data/dto/auth/request/login_request.dart';

abstract class AuthRepository {
  Future<TokenResponseEntity> login({required LoginRequest loginRequest});

  Future<TokenResponseEntity> register({
    required RegisterRequest registerRequest,
  });
}
