import 'package:promise_with_me_flutter/core/util/dio_request_entity.dart';

class RegisterRequest {
  final String nickname;
  final String email;
  final String password;

  const RegisterRequest({
    required this.nickname,
    required this.email,
    required this.password,
  });

  DioRequestEntity toRequest() {
    return DioRequestEntity(
      data: {"nickname": nickname, "email": email, "password": password},
    );
  }
}
