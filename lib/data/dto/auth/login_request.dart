import '../../../core/util/dio_request_entity.dart';

class LoginRequest {
  final String email;
  final String password;
  final String deviceToken;

  const LoginRequest({
    required this.email,
    required this.password,
    required this.deviceToken,
  });

  DioRequestEntity toRequest() {
    return DioRequestEntity(
      data: {
        "email": email,
        "password": password,
        "deviceToken": deviceToken,
      },
    );
  }
}