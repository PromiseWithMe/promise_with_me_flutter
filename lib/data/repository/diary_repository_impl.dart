import 'dart:async';

import 'package:promise_with_me_flutter/data/data_source/remote/diary_data_source.dart';

import '../../domain/repository/diary_repository.dart';

class DiaryRepositoryImpl implements DiaryRepository {
  final DiaryDataSource _diaryDataSource;

  const DiaryRepositoryImpl({required DiaryDataSource diaryDataSource})
    : _diaryDataSource = diaryDataSource;

  @override
  Future<String?> getDiary() async {
    return _diaryDataSource.getDiary();
  }

  @override
  void setDiary({required String data}) async {
    _diaryDataSource.setDiary(data: data);
  }
}
