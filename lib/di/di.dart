import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promise_with_me_flutter/data/data_source/remote/auth_data_source.dart';
import 'package:promise_with_me_flutter/data/data_source/remote/calendar_data_source.dart';
import 'package:promise_with_me_flutter/data/data_source/remote/chat_data_source.dart';
import 'package:promise_with_me_flutter/data/data_source/remote/diary_data_source.dart';
import 'package:promise_with_me_flutter/data/repository/auth_repository_impl.dart';
import 'package:promise_with_me_flutter/data/repository/calendar_repository_impl.dart';
import 'package:promise_with_me_flutter/data/repository/chat_repository_impl.dart';
import 'package:promise_with_me_flutter/data/repository/diary_repository_impl.dart';
import 'package:promise_with_me_flutter/data/repository/promise_repository_impl.dart';
import 'package:promise_with_me_flutter/domain/repository/auth_repository.dart';
import 'package:promise_with_me_flutter/domain/repository/calendar_repository.dart';
import 'package:promise_with_me_flutter/domain/repository/chat_repository.dart';
import 'package:promise_with_me_flutter/domain/repository/diary_repository.dart';
import 'package:promise_with_me_flutter/domain/repository/promise_repository.dart';
import 'package:promise_with_me_flutter/domain/use_case/auth/login_use_case.dart';
import 'package:promise_with_me_flutter/domain/use_case/auth/register_use_case.dart';
import 'package:promise_with_me_flutter/domain/use_case/calendar/get_calendar_use_case.dart';
import 'package:promise_with_me_flutter/domain/use_case/chat/connect_chat_use_case.dart';
import 'package:promise_with_me_flutter/domain/use_case/chat/dispose_chat_use_case.dart';
import 'package:promise_with_me_flutter/domain/use_case/chat/get_chats_use_case.dart';
import 'package:promise_with_me_flutter/domain/use_case/chat/well_promise_use_case.dart';
import 'package:promise_with_me_flutter/domain/use_case/diary/connect_diary_use_case.dart';
import 'package:promise_with_me_flutter/domain/use_case/diary/set_diary_use_case.dart';
import 'package:promise_with_me_flutter/domain/use_case/promise/change_promise_state_use_case.dart';
import 'package:promise_with_me_flutter/domain/use_case/promise/create_promise_use_case.dart';
import 'package:promise_with_me_flutter/domain/use_case/promise/delete_promise_use_case.dart';
import 'package:promise_with_me_flutter/domain/use_case/promise/get_promises_use_case.dart';
import 'package:promise_with_me_flutter/domain/use_case/promise/update_promise_use_case.dart';
import 'package:promise_with_me_flutter/presentation/view_model/auth/auth_bloc.dart';
import 'package:promise_with_me_flutter/presentation/view_model/calendar/calendar_bloc.dart';
import 'package:promise_with_me_flutter/presentation/view_model/chat/chats_bloc.dart';
import 'package:promise_with_me_flutter/presentation/view_model/diary/diary_bloc.dart';
import 'package:promise_with_me_flutter/presentation/view_model/promise/promise_bloc.dart';
import 'package:promise_with_me_flutter/presentation/view_model/page_manager/page_index_cubit.dart';
import 'package:promise_with_me_flutter/presentation/view_model/promise/promise_filter_cubit.dart';

import '../data/data_source/remote/promise_data_source.dart';
import '../presentation/view_model/splash/splash_state_cubit.dart';

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
  UpdatePromiseUseCase updatePromiseUseCase = UpdatePromiseUseCase(
    promiseRepository: promiseRepository,
  );
  DeletePromiseUseCase deletePromiseUseCase = DeletePromiseUseCase(
    promiseRepository: promiseRepository,
  );
  ChangePromiseStateUseCase changePromiseStateUseCase =
      ChangePromiseStateUseCase(promiseRepository: promiseRepository);

  // chat
  ChatDataSource chatDataSource = ChatDataSource();
  ChatRepository chatRepository = ChatRepositoryImpl(
    chatDataSource: chatDataSource,
  );
  ConnectChatUseCase connectChatUseCase = ConnectChatUseCase(
    chatRepository: chatRepository,
  );
  DisposeChatUseCase disposeChatUseCase = DisposeChatUseCase(
    chatRepository: chatRepository,
  );
  WellPromiseUseCase wellPromiseUseCase = WellPromiseUseCase(
    chatRepository: chatRepository,
  );
  GetChatsUseCase getChatsUseCase = GetChatsUseCase(
    chatRepository: chatRepository,
  );

  // diary
  DiaryDataSource diaryDataSource = DiaryDataSource();
  DiaryRepository diaryRepository = DiaryRepositoryImpl(
    diaryDataSource: diaryDataSource,
  );
  GetDiaryUseCase connectDiaryUseCase = GetDiaryUseCase(
    diaryRepository: diaryRepository,
  );
  SetDiaryUseCase setDiaryUseCase = SetDiaryUseCase(
    diaryRepository: diaryRepository,
  );

  // calendar
  CalendarDataSource calendarDataSource = CalendarDataSource();
  CalendarRepository calendarRepository = CalendarRepositoryImpl(
    calendarDataSource: calendarDataSource,
  );
  GetCalendarUseCase getCalendarUseCase = GetCalendarUseCase(
    calendarRepository: calendarRepository,
  );

  return [
    /// cubit
    BlocProvider<PageIndexCubit>(create: (context) => PageIndexCubit()),
    BlocProvider<PromiseFilterCubit>(create: (context) => PromiseFilterCubit()),
    BlocProvider<SplashStateCubit>(create: (context) => SplashStateCubit()),

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
          updatePromiseUseCase: updatePromiseUseCase,
          deletePromiseUseCase: deletePromiseUseCase,
          changePromiseStateUseCase: changePromiseStateUseCase,
        );
      },
    ),

    BlocProvider<ChatsBloc>(
      create: (context) {
        return ChatsBloc(
          getChatsUseCase: getChatsUseCase,
          connectChatUseCase: connectChatUseCase,
          disposeChatUseCase: disposeChatUseCase,
          wellPromiseUseCase: wellPromiseUseCase,
        );
      },
    ),

    BlocProvider<DiaryBloc>(
      create: (context) {
        return DiaryBloc(
          connectDiaryUseCase: connectDiaryUseCase,
          setDiaryUseCase: setDiaryUseCase,
        );
      },
    ),

    BlocProvider<CalendarBloc>(
      create: (context) {
        return CalendarBloc(getCalendarUseCase: getCalendarUseCase);
      },
    ),
  ];
}
