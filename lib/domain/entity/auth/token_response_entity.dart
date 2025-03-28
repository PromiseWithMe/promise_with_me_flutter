class TokenResponseEntity {
  final String accessToken;
  final String refreshToken;

  const TokenResponseEntity({
    required this.accessToken,
    required this.refreshToken,
  });

  factory TokenResponseEntity.fromJson(Map<String, dynamic> json) {
    return TokenResponseEntity(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
