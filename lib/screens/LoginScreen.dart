import 'package:flutter/material.dart';
import 'package:zap/Components/LoginComponent.dart';
import 'package:zap/Components/SignUpComponent.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _loginActive = true;

  @override
  void initState() {
    print("login init");
    super.initState();
  }

  @override
  void dispose() {
    print("login dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  _loginActive ? 'Bonjour' : "Jump on the Board",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => {
                      setState(() {
                        _loginActive = true;
                      })
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color:
                              _loginActive ? Colors.blue : Color(0XFF5A5A5E),
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "|",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => {
                      setState(() {
                        _loginActive = false;
                      })
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color:
                              _loginActive ? Color(0XFF5A5A5E) : Colors.blue,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              _loginActive ? LoginComponent() : SignUpComponent()
            ],
          ),
        ),
      ),
    );
  }
}
