import 'package:promise_with_me_flutter/data/dto/auth/request/login_request.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final LoginRequest loginRequest;

  LoginEvent({required this.loginRequest});
}
