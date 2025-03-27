import 'package:dio/dio.dart';

class ExceptionResponseModel {
  final int statusCode;
  final String message;
  final String path;

  const ExceptionResponseModel({
    required this.statusCode,
    required this.message,
    required this.path,
  });

  factory ExceptionResponseModel.fromJson(Response<dynamic> response) {
    return ExceptionResponseModel(
      statusCode: response.data['statusCode'],
      message: response.data['message'],
      path: response.data['path'],
    );
  }
}
