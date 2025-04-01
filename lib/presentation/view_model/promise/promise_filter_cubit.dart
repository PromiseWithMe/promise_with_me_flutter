import 'package:promise_with_me_flutter/presentation/view_model/promise/day_of_week_cubit.dart';

class PromiseFilterCubit extends DayOfWeekCubit {
  void init() {
    emit([
      MapEntry('일', false),
      MapEntry('월', false),
      MapEntry('화', false),
      MapEntry('수', false),
      MapEntry('목', false),
      MapEntry('금', false),
      MapEntry('토', false),
    ]);
  }
}
