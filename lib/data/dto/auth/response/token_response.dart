import 'package:promise_with_me_flutter/domain/entity/auth/token_response_entity.dart';

class TokenResponse {
  final String accessToken;
  final String refreshToken;

  const TokenResponse({required this.accessToken, required this.refreshToken});

  factory TokenResponse.fromJson(Map<String, dynamic> json) {
    return TokenResponse(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }

  TokenResponseEntity toEntity() {
    return TokenResponseEntity(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
