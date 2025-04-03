import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvValues {
  static final String baseUrl = dotenv.get("BASE_URL");
  static final String baseUrlWs = dotenv.get("BASE_URL_WS");
  static final String accessTokenStorage = dotenv.get("ACCESS_TOKEN_STORAGE");
  static final String refreshTokenStorage = dotenv.get("REFRESH_TOKEN_STORAGE");
}
