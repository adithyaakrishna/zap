// ignore_for_file: prefer_const_constructors_in_immutables, file_names, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpComponent extends StatefulWidget {
  SignUpComponent({Key? key}) : super(key: key);

  @override
  _SignUpComponentState createState() => _SignUpComponentState();
}

class _SignUpComponentState extends State<SignUpComponent> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _username = TextEditingController();
  bool _isLoading = false;

  handleSignUp() async {
    setState(() {
      _isLoading = true;
    });
    if (_passwordController.text == _confirmPasswordController.text) {
      final _auth = FirebaseAuth.instance;

      _auth
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((user) async {
        // ignore: deprecated_member_use
        await user.user!.updateProfile(
            displayName: _username.text,
            photoURL:
                "https://images.unsplash.com/photo-1590959651373-a3db0f38a961?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=937&q=80");
      }).then((res) {
        FirebaseFirestore.instance
            .collection("users")
            .doc(_auth.currentUser!.uid)
            .set({
          "name": _auth.currentUser!.displayName,
          "email": _auth.currentUser!.email,
          "profileImage": _auth.currentUser!.photoURL,
          "repos": [],
          "bio": "",
          "status": "Thinking"
        });
      }).whenComplete(() {
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          
          width: MediaQuery.of(context).size.width * 0.9,
          margin: EdgeInsets.only(top: 20, bottom: 20),
          child: TextField(
            
            controller: _username,
            style: TextStyle(color: Colors.white),
            cursorColor: Color(0XFF5C7ECC),
            decoration: InputDecoration(
              hintText: "Username",
              hintStyle: TextStyle(
                color: Color(0XFF5A5A5E),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0XFF5C7ECC), width: 1.0),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0XFF5A5A5E),
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          margin: EdgeInsets.only(top: 20, bottom: 20),
          child: TextField(
            controller: _emailController,
            style: TextStyle(color: Colors.white),
            cursorColor: Color(0XFF5C7ECC),
            decoration: InputDecoration(
              hintText: "Email",
              hintStyle: TextStyle(
                color: Color(0XFF5A5A5E),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0XFF5C7ECC), width: 1.0),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0XFF5A5A5E),
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          margin: EdgeInsets.only(top: 20, bottom: 20),
          child: TextField(
            obscureText: true,
            controller: _passwordController,
            style: TextStyle(color: Colors.white),
            cursorColor: Color(0XFF5C7ECC),
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(
                color: Color(0XFF5A5A5E),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0XFF5C7ECC), width: 1.0),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0XFF5A5A5E),
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          margin: EdgeInsets.only(top: 20, bottom: 20),
          child: TextField(
            obscureText: true,
            controller: _confirmPasswordController,
            style: TextStyle(color: Colors.white),
            cursorColor: Color(0XFF5C7ECC),
            decoration: InputDecoration(
              hintText: "Confirm Password",
              hintStyle: TextStyle(
                color: Color(0XFF5A5A5E),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0XFF5C7ECC), width: 1.0),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0XFF5A5A5E),
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 50,
          margin: EdgeInsets.only(top: 20, bottom: 20),
          child: FlatButton(
            onPressed: () {
              handleSignUp();
            },
            child: _isLoading
                ? CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0XFFFA7777)),
                  )
                : Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20),
                  ),
            textColor: Colors.white,
            color: Color(0XFF5C7ECC),
          ),
        ),
        Text(
          "or",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: 50,
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: SignInButton(
              Buttons.Google,
              text: "Sign Up with Google",
              onPressed: () {},
            )),
      ],
    );
  }
}
