import 'package:dio/dio.dart';

class DioGetReqModel {
  final Map<String, dynamic>? queryParameters;
  final Object? data;
  final Options? options;

  const DioGetReqModel({this.data, this.options, this.queryParameters});
}
