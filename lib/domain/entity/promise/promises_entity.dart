import 'package:promise_with_me_flutter/domain/entity/promise/promise_entity.dart';

class PromisesEntity {
  final List<PromiseEntity> promises;

  PromisesEntity({required this.promises});

  factory PromisesEntity.fromJson(Map<String, dynamic> json) {
    return PromisesEntity(
      promises:
          json['promises']
              .map<PromiseEntity>((e) => PromiseEntity.fromJson(e))
              .toList(),
    );
  }
}
