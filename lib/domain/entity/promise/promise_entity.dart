import 'package:promise_with_me_flutter/domain/entity/promise/day_of_week.dart';

class PromiseEntity {
  final String id;
  final String title;
  final DayOfWeek dayOfWeek;
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

  factory PromiseEntity.fromJson(Map<String, dynamic> json) {
    return PromiseEntity(
      id: json['id'],
      title: json['title'],
      dayOfWeek: DayOfWeek.fromJson(json['dayOfWeek']),
      promiseState: json['promiseState'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
