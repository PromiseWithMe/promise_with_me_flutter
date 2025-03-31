import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promise_with_me_flutter/data/data_source/remote/auth_data_source.dart';
import 'package:promise_with_me_flutter/data/repository/auth_repository_impl.dart';
import 'package:promise_with_me_flutter/data/repository/promise_repository_impl.dart';
import 'package:promise_with_me_flutter/domain/repository/auth_repository.dart';
import 'package:promise_with_me_flutter/domain/repository/promise_repository.dart';
import 'package:promise_with_me_flutter/domain/use_case/auth/login_use_case.dart';
import 'package:promise_with_me_flutter/domain/use_case/auth/register_use_case.dart';
import 'package:promise_with_me_flutter/domain/use_case/promise/create_promise_use_case.dart';
import 'package:promise_with_me_flutter/domain/use_case/promise/get_promises_use_case.dart';
import 'package:promise_with_me_flutter/presentation/view_model/auth/auth_bloc.dart';
import 'package:promise_with_me_flutter/presentation/view_model/promise/promise_bloc.dart';
import 'package:promise_with_me_flutter/presentation/view_model/page_manager/page_index_cubit.dart';

import '../data/data_source/remote/promise_data_source.dart';

Future<List<BlocProvider>> di() async {
  // auth
  AuthDataSource authDataSource = AuthDataSource();
  AuthRepository authRepository = AuthRepositoryImpl(
    authDataSource: authDataSource,
  );
  LoginUseCase loginUseCase = LoginUseCase(authRepository: authRepository);
  RegisterUseCase registerUseCase = RegisterUseCase(
    authRepository: authRepository,
  );

  // promise
  PromiseDataSource promiseDataSource = PromiseDataSource();
  PromiseRepository promiseRepository = PromiseRepositoryImpl(
    promiseDataSource: promiseDataSource,
  );
  GetPromisesUseCase getPromisesUseCase = GetPromisesUseCase(
    promiseRepository: promiseRepository,
  );
  CreatePromiseUseCase createPromiseUseCase = CreatePromiseUseCase(
    promiseRepository: promiseRepository,
  );

  return [
    /// cubit
    BlocProvider<PageIndexCubit>(create: (context) => PageIndexCubit()),

    /// bloc
    BlocProvider<AuthBloc>(
      create: (context) {
        return AuthBloc(
          loginUseCase: loginUseCase,
          registerUseCase: registerUseCase,
        );
      },
    ),

    BlocProvider<PromiseBloc>(
      create: (context) {
        return PromiseBloc(
          getPromisesUseCase: getPromisesUseCase,
          createPromiseUseCase: createPromiseUseCase,
        );
      },
    ),
  ];
}
