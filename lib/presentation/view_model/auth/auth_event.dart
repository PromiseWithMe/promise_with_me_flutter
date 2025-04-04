import 'package:promise_with_me_flutter/data/dto/auth/login_request.dart';
import 'package:promise_with_me_flutter/data/dto/auth/register_request.dart';

abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final LoginRequest loginRequest;

  LoginEvent({required this.loginRequest});
}

class RegisterEvent extends AuthEvent {
  final RegisterRequest registerRequest;

  RegisterEvent({required this.registerRequest});
}
