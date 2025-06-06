import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  ApiService._();

  static String supabaseUrl = dotenv.env['SUPABASE_URL'] ?? 'default_url';
  static String supabaseKey = dotenv.env['SUPABSE_KEY'] ?? 'default_key';
}
