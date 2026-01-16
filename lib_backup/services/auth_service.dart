import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  bool get isLoggedIn => currentUser != null;

  Future<void> signInAnonymously() async {
    if (_auth.currentUser == null) {
      await _auth.signInAnonymously();
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
