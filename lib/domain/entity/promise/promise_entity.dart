import 'package:promise_with_me_flutter/core/util/enum/promise_state_enum.dart';
import 'package:promise_with_me_flutter/domain/entity/promise/day_of_week.dart';

class PromiseEntity {
  final String id;
  final String title;
  final DayOfWeek dayOfWeek;
  final PromiseState promiseState;
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
      case PromiseState.NotCompleted:
        return null;
      case PromiseState.Completed:
        return "성공";
      case PromiseState.Skip:
        return "스킵";
    }
  }

  factory PromiseEntity.fromJson(Map<String, dynamic> json) {
    return PromiseEntity(
      id: json['id'],
      title: json['title'],
      dayOfWeek: DayOfWeek.fromJson(json['dayOfWeek']),
      promiseState: PromiseState.values.firstWhere(
        (e) => e.name == json['promiseState'],
      ),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
