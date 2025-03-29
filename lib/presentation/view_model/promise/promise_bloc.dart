import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promise_with_me_flutter/core/bloc/bloc_state.dart';
import 'package:promise_with_me_flutter/domain/entity/promise/promises_entity.dart';
import 'package:promise_with_me_flutter/domain/use_case/promise/get_promises_use_case.dart';
import 'package:promise_with_me_flutter/presentation/view_model/promise/promise_event.dart';

class PromiseBloc extends Bloc<PromiseEvent, BlocState<PromisesEntity>> {
  final GetPromisesUseCase _getPromisesUseCase;

  PromiseBloc({required GetPromisesUseCase getPromisesUseCase})
    : _getPromisesUseCase = getPromisesUseCase,
      super(Empty()) {
    on<GetPromisesEvent>(getPromisesEventHandler);
  }

  Future<void> getPromisesEventHandler(
    GetPromisesEvent event,
    Emitter<BlocState<PromisesEntity>> emit,
  ) async {
    emit(Loading());

    try {
      final PromisesEntity response = await _getPromisesUseCase.execute(
        getPromisesRequest: event.getPromisesRequest,
      );
      emit(Loaded(data: response));
    } on DioException catch (error) {
      if (error.requestOptions.extra['retry'] == true) {
        final PromisesEntity response = await _getPromisesUseCase.execute(
          getPromisesRequest: event.getPromisesRequest,
        );
        emit(Loaded(data: response));
      } else {
        emit(Error(exception: error));
      }
    }
  }
}
