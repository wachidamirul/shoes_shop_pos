import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../utils/storage_utility.dart';
import '../utils/env.dart';

class AuthService {
  final MyLocalStorage localStorage = MyLocalStorage();
  final SupabaseClient supabase = Supabase.instance.client;

  /// Returns the current authenticated user, or null if not signed in.
  User? get currentUser => supabase.auth.currentUser;

  /// Signs in with google
  Future<void> nativeGoogleSignIn() async {
    var webClientId = EnvService.googleWebClientId;
    var iosClientId = EnvService.googleIosClientId;

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;
    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }
    await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
    await localStorage.saveData('isLogin', true);
  }

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
