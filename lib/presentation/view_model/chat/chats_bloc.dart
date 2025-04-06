import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promise_with_me_flutter/core/bloc/bloc_state.dart';
import 'package:promise_with_me_flutter/domain/entity/chat/chat_entity.dart';
import 'package:promise_with_me_flutter/domain/entity/chat/chats_entity.dart';
import 'package:promise_with_me_flutter/domain/use_case/chat/get_chats_use_case.dart';
import 'package:promise_with_me_flutter/presentation/view_model/chat/chats_event.dart';

import '../../../domain/use_case/chat/connect_chat_use_case.dart';
import '../../../domain/use_case/chat/dispose_chat_use_case.dart';
import '../../../domain/use_case/chat/well_promise_use_case.dart';

class ChatsBloc extends Bloc<ChatsEvent, BlocState<ChatsEntity>> {
  final GetChatsUseCase _getChatsUseCase;
  final ConnectChatUseCase _connectChatUseCase;
  final WellPromiseUseCase _wellPromiseUseCase;
  final DisposeChatUseCase _disposeChatUseCase;

  ChatsBloc({
    required GetChatsUseCase getChatsUseCase,
    required ConnectChatUseCase connectChatUseCase,
    required DisposeChatUseCase disposeChatUseCase,
    required WellPromiseUseCase wellPromiseUseCase,
  }) : _getChatsUseCase = getChatsUseCase,
       _connectChatUseCase = connectChatUseCase,
       _disposeChatUseCase = disposeChatUseCase,
       _wellPromiseUseCase = wellPromiseUseCase,
       super(Empty()) {
    on<GetChatsEvent>(_getChatsEventHandler);
    on<AddLocalChatEvent>(_addLocalChatEventHandler);
    on<ConnectChatEvent>(_connectChatEventHandler);
    on<DisposeChatEvent>(_disposeChatEventHandler);
    on<WellPromiseEvent>(_wellPromiseEventHandler);
  }

  void _connectChatEventHandler(
    ConnectChatEvent event,
    Emitter<BlocState<ChatsEntity>> emit,
  ) async {
    try {
      final streamController = StreamController<String>.broadcast();
      _connectChatUseCase.execute(chatStreamController: streamController);
    } on DioException catch (e) {
      emit(Error(exception: e));
    }
  }

  void _disposeChatEventHandler(
    DisposeChatEvent event,
    Emitter<BlocState<ChatsEntity>> emit,
  ) async {
    try {
      _disposeChatUseCase.execute();
    } on DioException catch (e) {
      emit(Error(exception: e));
    }
  }

  void _wellPromiseEventHandler(
    WellPromiseEvent event,
    Emitter<BlocState<ChatsEntity>> emit,
  ) async {
    await _wellPromiseUseCase.execute(
      wellPromiseRequest: event.wellPromiseRequest,
    );
  }

  Future<void> _getChatsEventHandler(
    GetChatsEvent event,
    Emitter<BlocState<ChatsEntity>> emit,
  ) async {
    emit(Loading());

    try {
      final ChatsEntity response = await _getChatsUseCase.execute(
        getChatsRequest: event.getChatsRequest,
      );
      emit(Loaded(data: response));
    } on DioException catch (error) {
      if (error.requestOptions.extra['retry'] == true) {
        final ChatsEntity response = await _getChatsUseCase.execute(
          getChatsRequest: event.getChatsRequest,
        );
        emit(Loaded(data: response));
      } else {
        emit(Error(exception: error));
      }
    }
  }

  Future<void> _addLocalChatEventHandler(
    AddLocalChatEvent event,
    Emitter<BlocState<ChatsEntity>> emit,
  ) async {
    final currentChats = List<ChatEntity>.from(state.value.chats);

    currentChats.add(ChatEntity(id: 0, role: 1, content: event.content));
    currentChats.add(ChatEntity(id: 1, role: 2, content: ""));

    final lastIndex = currentChats.length - 1;
    await for (var data in _connectChatUseCase.chat) {
      currentChats[lastIndex] = currentChats[lastIndex].copyWith(
        content: currentChats[lastIndex].content + data,
      );

      emit(
        Loaded(
          data: ChatsEntity(chats: state.value.copyWith(chats: currentChats)),
        ),
      );
    }
  }
}
