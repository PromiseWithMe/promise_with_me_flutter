import '../../../core/util/dio_request_entity.dart';

class LoginRequest {
  final String email;
  final String password;

  const LoginRequest({required this.email, required this.password});

  DioRequestEntity toRequest() {
    return DioRequestEntity(data: {"email": email, "password": password});
  }
}
