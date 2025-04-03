import 'dart:async';

import 'package:promise_with_me_flutter/domain/repository/diary_repository.dart';

class GetDiaryUseCase {
  final DiaryRepository _diaryRepository;

  const GetDiaryUseCase({required DiaryRepository diaryRepository})
    : _diaryRepository = diaryRepository;

  Future<String> execute() async => await _diaryRepository.getDiary();
}
