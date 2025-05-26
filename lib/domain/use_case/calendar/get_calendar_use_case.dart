import 'package:promise_with_me_flutter/data/dto/calendar/get_calendar_request.dart';
import 'package:promise_with_me_flutter/domain/entity/calendar/calendars_entity.dart';
import 'package:promise_with_me_flutter/domain/repository/calendar_repository.dart';

class GetCalendarUseCase {
  final CalendarRepository _calendarRepository;

  const GetCalendarUseCase({required CalendarRepository calendarRepository})
    : _calendarRepository = calendarRepository;

  Future<CalendarsEntity> execute({
    required GetCalendarRequest getCalendarRequest,
  }) async => await _calendarRepository.getCalendar(
    getCalendarRequest: getCalendarRequest,
  );
}
