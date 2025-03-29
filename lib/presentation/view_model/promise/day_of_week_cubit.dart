import 'package:flutter_bloc/flutter_bloc.dart';

class DayOfWeekCubit extends Cubit<List<MapEntry<String, bool>>> {
  DayOfWeekCubit()
    : super([
        MapEntry('일', false),
        MapEntry('월', false),
        MapEntry('화', false),
        MapEntry('수', false),
        MapEntry('목', false),
        MapEntry('금', false),
        MapEntry('토', false),
      ]);

  toggleState(int index) {
    List<MapEntry<String, bool>> updatedState = List.from(state);
    updatedState[index] = MapEntry(
      updatedState[index].key,
      !updatedState[index].value,
    );

    emit(updatedState);
  }

  List<String> dayOfWeekAsRequest() {
    List<String> daysAsRequest = [];

    state.where((entry) => entry.value).forEach((value) {
      switch (value.key) {
        case '일':
          daysAsRequest.add('SUN');
        case '월':
          daysAsRequest.add('MON');
        case '화':
          daysAsRequest.add('TUE');
        case '수':
          daysAsRequest.add('WED');
        case '목':
          daysAsRequest.add('THU');
        case '금':
          daysAsRequest.add('FRI');
        case '토':
          daysAsRequest.add('SAT');
        default:
          break;
      }
    });

    return daysAsRequest;
  }
}
