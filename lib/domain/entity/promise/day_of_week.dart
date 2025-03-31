class DayOfWeek {
  List<String> dayOfWeek;

  DayOfWeek({required this.dayOfWeek});

  String get displayDays {
    if (dayOfWeek.isEmpty) {
      return '오늘!!';
    }

    return dayOfWeek.join(', ');
  }

  List<MapEntry<String, bool>> toListMapEntry(List<String> dayOfWeek) {
    final listMapEntry = [
      MapEntry('일', false),
      MapEntry('월', false),
      MapEntry('화', false),
      MapEntry('수', false),
      MapEntry('목', false),
      MapEntry('금', false),
      MapEntry('토', false),
    ];

    listMapEntry.map((entry) {
      if (dayOfWeek.contains(entry.key)) {
        return MapEntry(entry.key, true);
      }
      return entry;
    }).toList();

    return listMapEntry;
  }

  factory DayOfWeek.fromJson(List<dynamic> json) {
    return DayOfWeek(dayOfWeek: List<String>.from(json));
  }
}
