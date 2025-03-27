import 'package:dio/dio.dart';
import 'exception_response_model.dart';

enum BlocStateEnum { empty, loading, error, loaded }

abstract class BlocState<T> {
  BlocStateEnum blocState;
  T? valueOfNull;
  DioException? errorOfNull;

  BlocState({required this.blocState, this.valueOfNull, this.errorOfNull});

  T get value => valueOfNull!;

  ExceptionResponseModel get error =>
      ExceptionResponseModel.fromJson(errorOfNull!.response!);
}

class Empty<T> extends BlocState<T> {
  Empty() : super(blocState: BlocStateEnum.empty);
}

class Loading<T> extends BlocState<T> {
  Loading() : super(blocState: BlocStateEnum.loading);
}

class Error<T> extends BlocState<T> {
  final DioException exception;

  Error({required this.exception})
    : super(blocState: BlocStateEnum.error, errorOfNull: exception);
}

class Loaded<T> extends BlocState<T> {
  final T? data;

  Loaded({required this.data})
    : super(blocState: BlocStateEnum.loaded, valueOfNull: data);
}
