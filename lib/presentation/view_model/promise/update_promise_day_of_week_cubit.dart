import 'package:promise_with_me_flutter/presentation/view_model/promise/day_of_week_cubit.dart';

class UpdatePromiseDayOfWeekCubit extends DayOfWeekCubit {
  final List<MapEntry<String, bool>> dayOfWeek;

  UpdatePromiseDayOfWeekCubit({required this.dayOfWeek})
    : super(defaultDayOfWeek: dayOfWeek);
}
