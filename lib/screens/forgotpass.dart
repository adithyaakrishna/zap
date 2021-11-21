import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../loading.dart';
import 'LoginScreen.dart';

String email = "";
final FirebaseAuth _auth = FirebaseAuth.instance;

class ForgotScreen extends StatefulWidget {
  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final _formAddDelay = GlobalKey<ScaffoldState>();
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _formAddDelay,
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _form,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Image.asset(
                      "assets/Zap-Logo.jpeg",
                      fit: BoxFit.contain,
                    ),
                  ),
                  TextFormField(
                    validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                    decoration: InputDecoration(
                      focusColor: Colors.white,
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Enter your Email",
                      hintStyle:
                          TextStyle(color: Color(appbarcolor), fontSize: 20.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide(
                          color: Color(appbarcolor),
                          width: 1.4,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: BorderSide(
                          color: Color(appbarcolor),
                          width: 1.4,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.010,
                  ),
                  Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color(appbarcolor),
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width * 0.25,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () async {
                        if (_form.currentState!.validate()) {
                          resetPassword(email).whenComplete(() {
                            return ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    backgroundColor: Color(appbarcolor),
                                    duration: Duration(seconds: 100),
                                    content: Text(
                                        "A mail containing password reset details has been sent to you"),
                                    action: SnackBarAction(
                                        label: "Okay",
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginScreen()));
                                        })));
                          });
                        }
                      },
                      child: Text(
                        "Reset Password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  FlatButton(
                    color: Color(appbarcolor),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }
}
