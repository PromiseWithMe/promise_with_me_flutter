import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promise_with_me_flutter/data/data_source/auth_data_source.dart';
import 'package:promise_with_me_flutter/data/repository/auth_repository_impl.dart';
import 'package:promise_with_me_flutter/domain/repository/auth_repository.dart';
import 'package:promise_with_me_flutter/domain/use_case/auth/login_use_case.dart';
import 'package:promise_with_me_flutter/presentation/auth/view_model/auth_bloc.dart';

Future<List<BlocProvider>> di() async {
  // auth
  AuthDataSource authDataSource = AuthDataSource();
  AuthRepository authRepository = AuthRepositoryImpl(
    authDataSource: authDataSource,
  );
  LoginUseCase loginUseCase = LoginUseCase(authRepository: authRepository);

  return [
    BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(loginUseCase: loginUseCase),
    ),
  ];
}
