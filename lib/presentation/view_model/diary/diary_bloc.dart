import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promise_with_me_flutter/core/bloc/bloc_state.dart';
import 'package:promise_with_me_flutter/domain/use_case/diary/connect_diary_use_case.dart';
import 'package:promise_with_me_flutter/domain/use_case/diary/set_diary_use_case.dart';
import 'package:promise_with_me_flutter/presentation/view_model/diary/diary_event.dart';

class DiaryBloc extends Bloc<DiaryEvent, BlocState<String>> {
  final GetDiaryUseCase _getDiaryUseCase;
  final SetDiaryUseCase _setDiaryUseCase;

  DiaryBloc({
    required SetDiaryUseCase setDiaryUseCase,
    required GetDiaryUseCase connectDiaryUseCase,
  }) : _setDiaryUseCase = setDiaryUseCase,
       _getDiaryUseCase = connectDiaryUseCase,
       super(Empty()) {
    on<GetDiaryEvent>(_getDiaryEventHandler);
    on<SetDiaryEvent>(_setDiaryEventHandler);
  }

  void _getDiaryEventHandler(
    GetDiaryEvent event,
    Emitter<BlocState<String>> emit,
  ) async {
    emit(Loading());

    try {
      final data = await _getDiaryUseCase.execute();
      emit(Loaded(data: data));
    } on DioException catch (e) {
      emit(Error(exception: e));
    }
  }

  void _setDiaryEventHandler(
    SetDiaryEvent event,
    Emitter<BlocState<String>> emit,
  ) async {
    emit(Loading());

    try {
      await _setDiaryUseCase.execute(data: event.data);
      final data = await _getDiaryUseCase.execute();

      emit(Loaded(data: data));
    } on DioException catch (e) {
      emit(Error(exception: e));
    }
  }
}
