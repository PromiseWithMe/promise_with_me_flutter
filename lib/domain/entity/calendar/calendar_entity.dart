import 'success_promise_entity.dart';

class CalendarEntity {
  String id;
  String date;
  String diary;
  List<SuccessPromiseEntity> successPromises;

  CalendarEntity({
    required this.id,
    required this.date,
    required this.diary,
    required this.successPromises,
  });

  factory CalendarEntity.fromJson(Map<String, dynamic> json) {
    return CalendarEntity(
      id: json['id'] as String,
      date: json['date'] as String,
      diary: json['diary'] as String,
      successPromises:
          (json['successPromises'] as List<dynamic>)
              .map(
                (e) => SuccessPromiseEntity.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['diary'] = diary;
    data['successPromises'] = successPromises.map((v) => v.toJson()).toList();
    return data;
  }
}
