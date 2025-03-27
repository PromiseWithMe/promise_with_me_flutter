class LoginRequest {
  final String email;
  final String password;

  const LoginRequest({required this.email, required this.password});

  Future<Map<String, dynamic>> toJson() async {
    Map<String, dynamic> data = <String, dynamic>{};

    data['email'] = email;
    data['password'] = password;

    return data;
  }
}
