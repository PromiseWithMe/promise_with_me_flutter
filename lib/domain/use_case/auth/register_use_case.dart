import 'package:promise_with_me_flutter/data/dto/auth/register_request.dart';
import 'package:promise_with_me_flutter/domain/entity/auth/token_response_entity.dart';
import 'package:promise_with_me_flutter/domain/repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _authRepository;

  const RegisterUseCase({required AuthRepository authRepository})
    : _authRepository = authRepository;

  Future<TokenResponseEntity> execute({
    required RegisterRequest registerRequest,
  }) async => await _authRepository.register(registerRequest: registerRequest);
}
