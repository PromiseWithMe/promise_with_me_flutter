import 'dart:convert';

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
