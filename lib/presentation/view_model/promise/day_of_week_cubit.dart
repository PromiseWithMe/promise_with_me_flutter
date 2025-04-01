import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promise_with_me_flutter/domain/entity/promise/day_of_week.dart';

class DayOfWeekCubit extends Cubit<List<MapEntry<String, bool>>> {
  final List<MapEntry<String, bool>>? defaultDayOfWeek;

  DayOfWeekCubit({this.defaultDayOfWeek})
    : super(
        defaultDayOfWeek ??
            [
              MapEntry('일', false),
              MapEntry('월', false),
              MapEntry('화', false),
              MapEntry('수', false),
              MapEntry('목', false),
              MapEntry('금', false),
              MapEntry('토', false),
            ],
      );

  toggleState(int index) {
    List<MapEntry<String, bool>> updatedState = List.from(state);
    updatedState[index] = MapEntry(
      updatedState[index].key,
      !updatedState[index].value,
    );

    emit(updatedState);
  }

  DayOfWeek dayOfWeekAsRequest() {
    List<String> daysAsRequest = [];

    state.where((entry) => entry.value).forEach((value) {
      daysAsRequest.add(value.key);
    });

    return DayOfWeek(dayOfWeek: daysAsRequest);
  }
}
