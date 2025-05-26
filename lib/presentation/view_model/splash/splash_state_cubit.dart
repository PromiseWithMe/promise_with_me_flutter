import 'package:flutter_bloc/flutter_bloc.dart';

class SplashStateCubit extends Cubit<bool> {
  SplashStateCubit() : super(false);

  bool _promiseLoaded = false;
  bool _diaryLoaded = false;
  bool _calendarLoaded = false;

  void promiseLoad() {
    _promiseLoaded = true;
    if (_promiseLoaded && _diaryLoaded && _calendarLoaded) {
      emit(true);
    }
  }

  void diaryLoad() {
    _diaryLoaded = true;
    if (_promiseLoaded && _diaryLoaded && _calendarLoaded) {
      emit(true);
    }
  }

  void calendarLoad() {
    _calendarLoaded = true;
    if (_promiseLoaded && _diaryLoaded && _calendarLoaded) {
      emit(true);
    }
  }
}
