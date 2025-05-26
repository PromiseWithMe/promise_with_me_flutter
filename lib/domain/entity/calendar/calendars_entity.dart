import 'calendar_entity.dart';

class CalendarsEntity {
  List<CalendarEntity> calendars;

  CalendarsEntity({required this.calendars});

  factory CalendarsEntity.fromJson(Map<String, dynamic> json) {
    return CalendarsEntity(
      calendars:
          (json['calendars'] as List<dynamic>)
              .map((v) => CalendarEntity.fromJson(v))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['calendars'] = calendars.map((v) => v.toJson()).toList();
    return data;
  }
}
