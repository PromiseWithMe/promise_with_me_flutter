class TokenResponseEntity {
  final String accessToken;
  final String refreshToken;

  const TokenResponseEntity({
    required this.accessToken,
    required this.refreshToken,
  });
}
