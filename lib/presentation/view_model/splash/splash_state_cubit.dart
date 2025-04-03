import 'package:flutter_bloc/flutter_bloc.dart';

class SplashStateCubit extends Cubit<bool> {
  SplashStateCubit() : super(false);

  bool _promiseLoaded = false;
  bool _diaryLoaded = false;

  void promiseLoad() {
    _promiseLoaded = true;
    if (_promiseLoaded && _diaryLoaded) {
      emit(true);
    }
  }

  void diaryLoad() {
    _diaryLoaded = true;
    if (_promiseLoaded && _diaryLoaded) {
      emit(true);
    }
  }
}
