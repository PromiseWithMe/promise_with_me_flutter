import 'package:promise_with_me_flutter/domain/repository/diary_repository.dart';

class SetDiaryUseCase {
  final DiaryRepository _diaryRepository;

  const SetDiaryUseCase({required DiaryRepository diaryRepository})
    : _diaryRepository = diaryRepository;

  Future<void> execute({required String data}) async =>
      _diaryRepository.setDiary(data: data);
}
