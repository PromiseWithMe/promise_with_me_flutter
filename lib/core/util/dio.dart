import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:promise_with_me_flutter/core/util/env_values.dart';
import 'package:promise_with_me_flutter/core/util/token_storage.dart';

final Dio dio = Dio(BaseOptions(baseUrl: EnvValues.baseUrl));

void dioInit() => dio.interceptors.add(CustomInterceptor());

class CustomInterceptor extends Interceptor {
  final Dio dio = Dio(BaseOptions(baseUrl: EnvValues.baseUrl));

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.path.contains('/auth/login') ||
        options.path.contains('/auth/register')) {
      debugPrint('[REQ] [${options.method}] ${options.uri} (No Token Needed)');
      return handler.next(options);
    }

    final accessToken = await TokenStorage.findAccessToken();
    if (accessToken == null) {
      return handler.reject(DioException(requestOptions: options));
    }
    options.headers['Authorization'] = 'Bearer $accessToken';

    debugPrint('[REQ] [${options.method}] ${options.uri}');
    return handler.next(options);
  }

  Future<ReIssueEntity> useReIssue(String refreshToken) async {
    try {
      final response = await dio.post(
        '/auth/re-issue',
        options: Options(headers: {"Authorization": "Bearer $refreshToken"}),
      );

      return ReIssueEntity.fromJson(response.data);
    } on DioException catch (e) {
      debugPrint('[ERROR] Token Re-Issue Failed: ${e.response}');
      rethrow;
    }
  }

  // 에러가 났을때
  @override
  void onError(err, ErrorInterceptorHandler handler) async {
    debugPrint(
      '[ERR] [${err.requestOptions.method}] ${err.requestOptions.uri} \n'
      '[Error Message] ${err.response}',
    );

    if (err.response?.statusCode == 401) {
      final String? refreshToken = await TokenStorage.findRefreshToken();
      if (refreshToken == null) {
        return handler.reject(err);
      }

      try {
        ReIssueEntity reIssueResponse = await useReIssue(refreshToken);

        await TokenStorage.writeAccessToken(
          accessToken: reIssueResponse.accessToken,
        );
        await TokenStorage.writeRefreshToken(
          refreshToken: reIssueResponse.refreshToken,
        );

        err.requestOptions.headers['Authorization'] =
            reIssueResponse.accessToken;

        final Response response = await dio.fetch(
          err.requestOptions..extra['retry'] = true,
        );

        return handler.resolve(response);
      } catch (e) {
        return handler.reject(err);
      }
    }
    return handler.reject(err);
  }
}

class ReIssueEntity {
  final String accessToken;
  final String refreshToken;

  const ReIssueEntity({required this.accessToken, required this.refreshToken});

  factory ReIssueEntity.fromJson(Map<String, dynamic> json) {
    return ReIssueEntity(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
