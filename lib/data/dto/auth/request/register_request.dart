class RegisterRequest {
  final String nickname;
  final String email;
  final String password;

  const RegisterRequest({
    required this.nickname,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};

    data['nickname'] = nickname;
    data['email'] = email;
    data['password'] = password;

    return data;
  }
}
