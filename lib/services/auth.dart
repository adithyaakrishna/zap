import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInEmailPass(email, password) async {
    try {
      UserCredential user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(user.user!.uid);
    } catch (e) {
      print("ERROR");
      print(e);
    }
  }
}
