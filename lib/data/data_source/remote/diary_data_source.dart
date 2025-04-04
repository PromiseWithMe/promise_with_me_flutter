import 'dart:async';

import 'package:promise_with_me_flutter/core/util/dio.dart';

class DiaryDataSource {
  Future<String?> getDiary() async {
    try {
      final response = await dio.get('/diary');
      return response.data;
    } catch (_) {
      rethrow;
    }
  }

  Future<void> setDiary({required String data}) async {
    try {
      await dio.post('/diary', data: {"data": data});
    } catch (_) {
      rethrow;
    }
  }
}
