import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promise_with_me_flutter/core/bloc/bloc_state.dart';
import 'package:promise_with_me_flutter/domain/entity/calendar/calendars_entity.dart';
import 'package:promise_with_me_flutter/domain/use_case/calendar/get_calendar_use_case.dart';
import 'package:promise_with_me_flutter/presentation/view_model/calendar/calendar_event.dart';

class CalendarBloc extends Bloc<CalendarEvent, BlocState<CalendarsEntity>> {
  final GetCalendarUseCase _getCalendarUseCase;

  CalendarBloc({required GetCalendarUseCase getCalendarUseCase})
    : _getCalendarUseCase = getCalendarUseCase,
      super(Empty()) {
    on<GetCalendarEvent>(_getCalendarEventHandler);
  }

  void _getCalendarEventHandler(
    GetCalendarEvent event,
    Emitter<BlocState<CalendarsEntity>> emit,
  ) async {
    try {
      final CalendarsEntity calendars = await _getCalendarUseCase.execute(
        getCalendarRequest: event.getCalendarRequest,
      );
      emit(Loaded(data: calendars));
    } on DioException catch (e) {
      emit(Error(exception: e));
    }
  }
}
