import 'package:promise_with_me_flutter/data/dto/calendar/get_calendar_request.dart';

abstract class CalendarEvent {}

class GetCalendarEvent extends CalendarEvent {
  final GetCalendarRequest getCalendarRequest;

  GetCalendarEvent({required this.getCalendarRequest});
}
