import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvService {
  EnvService._();

  static final String supabaseUrl = dotenv.env['SUPABASE_URL'] ?? 'default_url';
  static final String supabaseKey = dotenv.env['SUPABSE_KEY'] ?? 'default_key';

  static final String googleWebClientId =
      dotenv.env['GOOGLE_WEB_CLIENT_ID'] ?? 'default_web_client_id';
  static final String googleIosClientId =
      dotenv.env['GOOGLE_IOS_CLIENT_ID'] ?? 'default_ios_client_id';
  static final String googleAndroidClientId =
      dotenv.env['GOOGLE_ANDROID_CLIENT_ID'] ?? 'default_android_client_id';
}
