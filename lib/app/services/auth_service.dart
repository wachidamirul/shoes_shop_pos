import 'package:supabase_flutter/supabase_flutter.dart';
import '../utils/storage_utility.dart';

class AuthService {
  final MyLocalStorage localStorage = MyLocalStorage();
  final SupabaseClient supabase = Supabase.instance.client;

  /// Returns the current authenticated user, or null if not signed in.
  User? get currentUser => supabase.auth.currentUser;

  /// Signs in with google

  /// Signs in with email and password.
  Future<AuthResponse> signInWithPassword(String email, String password) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user == null) {
        throw AuthException("Invalid login credentials");
      }
      await localStorage.saveData('isLogin', true);
      return response;
    } on AuthException catch (e) {
      throw AuthException(e.message);
    } catch (e) {
      throw Exception("Sign in failed: $e");
    }
  }

  /// Signs up with email, password, and additional data.
  Future<AuthResponse> signUpWithPassword(
    String email,
    String password,
    dynamic data,
  ) async {
    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
        data: data,
      );
      if (response.user == null) {
        throw Exception("Sign up failed");
      }
      await localStorage.saveData('isLogin', true);
      return response;
    } catch (e) {
      throw Exception("Sign up failed: $e");
    }
  }

  /// Signs out the current user and clears local storage.
  Future<void> signOut() async {
    await localStorage.removeData('isLogin');
    await supabase.auth.signOut();
  }
}
