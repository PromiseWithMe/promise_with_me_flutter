import 'dart:async';

abstract class DiaryRepository {
  void setDiary({required String data});

  Future<String> getDiary();
}
