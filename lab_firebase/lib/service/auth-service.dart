import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Registration method with password confirmation check
  Future<String?> registration({
    required String email,
    required String password,
    required String confirm,
  }) async {
    try {
      // Check if password matches confirm password
      if (password != confirm) {
        return "Passwords do not match.";
      }

      // Check if password length is less than 8
      if (password.length < 8) {
        return "Password must be at least 8 characters long.";
      }

      // Proceed with Firebase user registration
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  // Signin method
  Future<String?> signin({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }
}
