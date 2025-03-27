import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promise_with_me_flutter/core/bloc/bloc_state.dart';
import 'package:promise_with_me_flutter/domain/entity/auth/token_response_entity.dart';
import 'package:promise_with_me_flutter/domain/use_case/auth/login_use_case.dart';
import 'package:promise_with_me_flutter/presentation/auth/view_model/auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, BlocState<TokenResponseEntity>> {
  final LoginUseCase _loginUseCase;

  AuthBloc({required LoginUseCase loginUseCase})
    : _loginUseCase = loginUseCase,
      super(Empty()) {
    on<LoginEvent>(loginEventHandler);
  }

  void loginEventHandler(
    LoginEvent event,
    Emitter<BlocState<TokenResponseEntity>> emit,
  ) async {}
}
