import 'package:flutter/material.dart';
// import 'package:zap/Components/LoginComponent.dart';
// import 'package:zap/Components/SignUpComponent.dart';
import 'package:zap/components/NavBarComponent.dart';
import 'package:zap/screens/LoginScreen.dart';
import 'package:zap/services/auth.dart';

import '../loading.dart';
import 'forgotpass.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _loading = false;
  final AuthService _auth = AuthService();
  //declaring the variables
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return _loading
        ? Loading()
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              backgroundColor: Color(scaffoldcolor),
              body: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formkey,
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
                          cursorColor: Colors.black,
                          validator: (val) =>
                              val!.isEmpty ? 'Enter an email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                          decoration: InputDecoration(
                            focusColor: Colors.white,
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
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
                        TextFormField(
                          cursorColor: Colors.black,
                          obscureText: true,
                          validator: (val) => val!.length < 6
                              ? 'Enter a password 6+ chars long'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0),
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
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            onPressed: () async {
                              if (_formkey.currentState!.validate()) {
                                setState(() {
                                  _loading = true;
                                });
                                bool result = await _auth
                                    .registerwithemailandpassuser(
                                        email, password)
                                    .whenComplete(() {
                                  setState(() {
                                    _loading = false;
                                  });
                                });
                                print("result is when you sign in $result");
                                if (result == true) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                                }
                                if (result == false) {
                                  setState(() {
                                    error =
                                        'Could not sign in with those credentials';
                                  });
                                }
                              }
                            },
                            child: Text(
                              "Sign Up",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
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
                            padding: const EdgeInsets.fromLTRB(
                                20.0, 15.0, 20.0, 15.0),
                            onPressed: () async {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                            },
                            child: const Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        InkWell(
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 14.0),
                            ),
                            onTap: () {
                              setState(() {});
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ForgotScreen()));
                            }),
                        Text(
                          error,
                          style: const TextStyle(
                              color: Colors.red, fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
