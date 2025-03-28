import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promise_with_me_flutter/core/bloc/bloc_state.dart';
import 'package:promise_with_me_flutter/domain/entity/auth/token_response_entity.dart';
import 'package:promise_with_me_flutter/domain/use_case/auth/login_use_case.dart';
import 'package:promise_with_me_flutter/domain/use_case/auth/register_use_case.dart';
import 'package:promise_with_me_flutter/presentation/auth/view_model/auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, BlocState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;

  AuthBloc({
    required LoginUseCase loginUseCase,
    required RegisterUseCase registerUseCase,
  }) : _loginUseCase = loginUseCase,
       _registerUseCase = registerUseCase,
       super(Empty()) {
    on<LoginEvent>(loginEventHandler);
    on<RegisterEvent>(registerEventHandler);
  }

  void loginEventHandler(LoginEvent event, Emitter<BlocState> emit) async {
    emit(Loading());

    try {
      TokenResponseEntity response = await _loginUseCase.execute(
        loginRequest: event.loginRequest,
      );

      emit(Loaded(data: null));
    } on DioException catch (error) {
      emit(Error(exception: error));
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

      emit(Loaded(data: null));
    } on DioException catch (error) {
      emit(Error(exception: error));
    }
  }
}
