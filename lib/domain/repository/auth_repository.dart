import 'package:promise_with_me_flutter/domain/entity/auth/token_response_entity.dart';

import '../../data/dto/auth/request/login_request.dart';

abstract class AuthRepository {
  Future<TokenResponseEntity> login({required LoginRequest loginRequest});
}
