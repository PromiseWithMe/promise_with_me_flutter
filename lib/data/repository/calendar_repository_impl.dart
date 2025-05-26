import 'package:promise_with_me_flutter/data/data_source/remote/calendar_data_source.dart';
import 'package:promise_with_me_flutter/data/dto/calendar/get_calendar_request.dart';
import 'package:promise_with_me_flutter/domain/entity/calendar/calendars_entity.dart';
import 'package:promise_with_me_flutter/domain/repository/calendar_repository.dart';

class CalendarRepositoryImpl implements CalendarRepository {
  final CalendarDataSource _calendarDataSource;

  const CalendarRepositoryImpl({required CalendarDataSource calendarDataSource})
    : _calendarDataSource = calendarDataSource;

  @override
  Future<CalendarsEntity> getCalendar({
    required GetCalendarRequest getCalendarRequest,
  }) {
    return _calendarDataSource.getCalendar(
      getCalendarRequest: getCalendarRequest,
    );
  }
}
