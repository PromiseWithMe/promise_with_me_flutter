import 'package:promise_with_me_flutter/domain/entity/auth/token_response_entity.dart';
import 'package:promise_with_me_flutter/domain/repository/auth_repository.dart';

import '../../../data/dto/auth/request/login_request.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  const LoginUseCase({required AuthRepository authRepository})
    : _authRepository = authRepository;

  Future<TokenResponseEntity> execute({required LoginRequest loginRequest}) =>
      _authRepository.login(loginRequest: loginRequest);
}
