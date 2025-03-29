import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promise_with_me_flutter/core/bloc/bloc_state.dart';
import 'package:promise_with_me_flutter/core/util/token_storage.dart';
import 'package:promise_with_me_flutter/domain/entity/auth/token_response_entity.dart';
import 'package:promise_with_me_flutter/domain/use_case/auth/login_use_case.dart';
import 'package:promise_with_me_flutter/domain/use_case/auth/register_use_case.dart';

import 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, BlocState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;

  AuthBloc({
    required LoginUseCase loginUseCase,
    required RegisterUseCase registerUseCase,
  }) : _loginUseCase = loginUseCase,
       _registerUseCase = registerUseCase,
       super(Empty()) {
    on<LoginEvent>(loginEventHandler, transformer: droppable());
    on<RegisterEvent>(registerEventHandler, transformer: droppable());
  }

  void loginEventHandler(LoginEvent event, Emitter<BlocState> emit) async {
    emit(Loading());

    try {
      TokenResponseEntity response = await _loginUseCase.execute(
        loginRequest: event.loginRequest,
      );

      TokenStorage.writeAccessToken(accessToken: response.accessToken);
      TokenStorage.writeRefreshToken(refreshToken: response.refreshToken);

      emit(Loaded(data: null));
    } on DioException catch (error) {
      emit(Error(exception: error));
    } catch (error) {
      rethrow;
    }
  }

  void registerEventHandler(
    RegisterEvent event,
    Emitter<BlocState> emit,
  ) async {
    emit(Loading());

    try {
      TokenResponseEntity response = await _registerUseCase.execute(
        registerRequest: event.registerRequest,
      );

      TokenStorage.writeAccessToken(accessToken: response.accessToken);
      TokenStorage.writeRefreshToken(refreshToken: response.refreshToken);

      emit(Loaded(data: null));
    } on DioException catch (error) {
      emit(Error(exception: error));
    } catch (error) {
      rethrow;
    }
  }
}
