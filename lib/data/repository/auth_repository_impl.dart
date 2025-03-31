import 'package:promise_with_me_flutter/data/data_source/remote/auth_data_source.dart';
import 'package:promise_with_me_flutter/data/dto/auth/register_request.dart';
import 'package:promise_with_me_flutter/domain/entity/auth/token_response_entity.dart';
import 'package:promise_with_me_flutter/domain/repository/auth_repository.dart';

import '../dto/auth/login_request.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSource;

  const AuthRepositoryImpl({required AuthDataSource authDataSource})
    : _authDataSource = authDataSource;

  @override
  Future<TokenResponseEntity> login({
    required LoginRequest loginRequest,
  }) async {
    return await _authDataSource.login(loginRequest: loginRequest);
  }

  @override
  Future<TokenResponseEntity> register({
    required RegisterRequest registerRequest,
  }) async {
    return await _authDataSource.register(registerRequest: registerRequest);
  }
}
