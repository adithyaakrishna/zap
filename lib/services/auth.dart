import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'dart:async';
import '../models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  CollectionReference locationReference =
      FirebaseFirestore.instance.collection('offices');
  getuser() async {
    final auth.User? userid = _auth.currentUser;
    final uid = userid!.uid;
    return uid.toString();
  }

//creating a firebase user object
  User? userfromfirebaseuser(auth.User user) {
    return user != null ? User(uid: user.uid) : null;
  }

//Creating a stream of signedin users
  // Stream<User> get user {
  //   return _auth.authStateChanges().map(userfromfirebaseuser);
  // }
  // Sign in anonymously

  Future<String> getCurrentUID() async {
    return (_auth.currentUser)!.uid;
  }

//Sign in with email and pass
  Future signinwithemailandpass(String email, String pass) async {
    try {
      auth.UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      auth.User? user = result.user;
      String userid = result.user.toString();
      return userid;
    } catch (e) {
      print(e.toString());
      return "false";
    }
  }

//register with email and pass as a user
  Future<bool> registerwithemailandpassuser(String email, String pass) async {
    try {
      auth.UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      auth.User? user = result.user;
      auth.User? users = _auth.currentUser;
      try {
        await user!.sendEmailVerification();
        return true;
      } catch (e) {
        print(e);
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> addLocation(
    String address,
    String id,
    String image,
    String lat,
    String lng,
    String name,
    String phone,
    String region,
  ) async {
    bool output = true;
    locationReference
        .add({
          "address": address,
          "id": id,
          "image": image,
          "lat": double.parse(lat),
          "lng": double.parse(lng),
          "name": name,
          "phone": phone,
          "region": region,
        })
        .then((value) => print("User Added"))
        .catchError((error) {
          print("Failed to add user: $error");
          output=false;
        });
    return output;
  }

  //Signout
  Future signout() async {
    auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
