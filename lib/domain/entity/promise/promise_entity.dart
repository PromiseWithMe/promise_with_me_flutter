class PromiseEntity {
  final String id;
  final String title;
  final List<String>? dayOfWeek;
  final int promiseState;
  final DateTime createdAt;

  PromiseEntity({
    required this.id,
    required this.title,
    required this.dayOfWeek,
    required this.promiseState,
    required this.createdAt,
  });

  String? get getPromiseState {
    switch (promiseState) {
      case 0:
        return null;
      case 1:
        return "성공";
      case 2:
        return "스킵";
      default:
        return '';
    }
  }

  String get getDayOfWeek {
    if (dayOfWeek == null) {
      return '오늘!!';
    }

    return dayOfWeek!
        .map((e) {
          switch (e) {
            case 'SUN':
              return '일';
            case 'MON':
              return '월';
            case 'TUE':
              return '화';
            case 'WED':
              return '수';
            case 'THU':
              return '목';
            case 'FRI':
              return '금';
            case 'SAT':
              return '토';
            default:
              return '';
          }
        })
        .join(', ');
  }

  factory PromiseEntity.fromJson(Map<String, dynamic> json) {
    return PromiseEntity(
      id: json['id'],
      title: json['title'],
      dayOfWeek: json['dayOfWeek'],
      promiseState: json['promiseState'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
