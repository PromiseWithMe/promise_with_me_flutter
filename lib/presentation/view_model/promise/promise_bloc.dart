import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promise_with_me_flutter/core/bloc/bloc_state.dart';
import 'package:promise_with_me_flutter/data/dto/promise/get_promises_request.dart';
import 'package:promise_with_me_flutter/domain/entity/promise/day_of_week.dart';
import 'package:promise_with_me_flutter/domain/entity/promise/promises_entity.dart';
import 'package:promise_with_me_flutter/domain/use_case/promise/create_promise_use_case.dart';
import 'package:promise_with_me_flutter/domain/use_case/promise/get_promises_use_case.dart';
import 'package:promise_with_me_flutter/presentation/view_model/promise/promise_event.dart';

class PromiseBloc extends Bloc<PromiseEvent, BlocState<PromisesEntity>> {
  final GetPromisesUseCase _getPromisesUseCase;
  final CreatePromiseUseCase _createPromiseUseCase;

  PromiseBloc({
    required GetPromisesUseCase getPromisesUseCase,
    required CreatePromiseUseCase createPromiseUseCase,
  }) : _getPromisesUseCase = getPromisesUseCase,
       _createPromiseUseCase = createPromiseUseCase,
       super(Empty()) {
    on<InitGetPromisesEvent>(
      initPromisesEventHandler,
      transformer: droppable(),
    );
    on<GetPromisesEvent>(getPromisesEventHandler, transformer: droppable());
    on<CreatePromiseEvent>(createPromiseEventHandler, transformer: droppable());
  }

  Future<void> initPromisesEventHandler(
    InitGetPromisesEvent event,
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

  Future<void> getPromisesEventHandler(
    GetPromisesEvent event,
    Emitter<BlocState<PromisesEntity>> emit,
  ) async {
    try {
      final PromisesEntity response = await _getPromisesUseCase.execute(
        getPromisesRequest: event.getPromisesRequest,
      );
      emit(
        Loaded(
          data: PromisesEntity(
            promises: state.value.promises + response.promises,
          ),
        ),
      );
    } on DioException catch (error) {
      if (error.requestOptions.extra['retry'] == true) {
        final PromisesEntity response = await _getPromisesUseCase.execute(
          getPromisesRequest: event.getPromisesRequest,
        );
        emit(
          Loaded(
            data: PromisesEntity(
              promises: state.value.promises + response.promises,
            ),
          ),
        );
      } else {
        emit(Error(exception: error));
      }
    }
  }

  Future<void> createPromiseEventHandler(
    CreatePromiseEvent event,
    Emitter<BlocState<PromisesEntity>> emit,
  ) async {
    emit(Loading());

    try {
      await _createPromiseUseCase.execute(
        createPromiseRequest: event.createPromiseRequest,
      );

      final PromisesEntity response = await _getPromisesUseCase.execute(
        getPromisesRequest: GetPromisesRequest(
          page: 0,
          dayOfWeek: DayOfWeek(dayOfWeek: []),
        ),
      );
      emit(Loaded(data: response));
    } on DioException catch (error) {
      if (error.requestOptions.extra['retry'] == true) {
        final PromisesEntity response = await _getPromisesUseCase.execute(
          getPromisesRequest: GetPromisesRequest(
            page: 0,
            dayOfWeek: DayOfWeek(dayOfWeek: []),
          ),
        );
        emit(Loaded(data: response));
      } else {
        emit(Error(exception: error));
      }
    }
  }
}
