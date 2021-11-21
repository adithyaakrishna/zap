import 'package:flutter/material.dart';
import 'package:zap/screens/HomeScreen.dart';
import 'package:zap/services/auth.dart';

import '../loading.dart';

class AddLocation extends StatefulWidget {
  @override
  _AddLocationState createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  final AuthService _auth = AuthService();

  //declaring the variables
  String error = '';
  String address = "";
  String id = "";
  String image = "";
  String lat = "";
  String lng = "";
  String name = "";
  String phone = "";
  String region = "";
  final _formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  bool _condition = false;

  @override
  Widget build(BuildContext context) {
    return _condition
        ? Loading()
        : Scaffold(
            backgroundColor: Color(scaffoldcolor),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                cursorColor: Color(appbarcolor),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  labelText: 'Name',
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(appbarcolor),
                                    ),
                                  ),
                                ),
                                validator: (val) =>
                                    val!.isEmpty ? 'Enter the name' : null,
                                onChanged: (value) {
                                  name = value;
                                },
                                onSaved: (addactivityname) {
                                  name = addactivityname!;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                cursorColor: Color(appbarcolor),
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  labelText: 'Phone Number',
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(appbarcolor),
                                    ),
                                  ),
                                ),
                                validator: (val) => val!.isEmpty
                                    ? 'Enter the phone number'
                                    : null,
                                onChanged: (value) {
                                  phone = value;
                                },
                                onSaved: (addactivityname) {
                                  phone = addactivityname!;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                cursorColor: Color(appbarcolor),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  labelText: 'region',
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(appbarcolor),
                                    ),
                                  ),
                                ),
                                validator: (val) =>
                                    val!.isEmpty ? 'Enter the Region' : null,
                                onChanged: (value) {
                                  region = value;
                                },
                                onSaved: (addactivityname) {
                                  region = addactivityname!;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                cursorColor: Color(appbarcolor),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  labelText: 'Address',
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(appbarcolor),
                                    ),
                                  ),
                                ),
                                validator: (val) =>
                                    val!.isEmpty ? 'Enter the Address' : null,
                                onChanged: (value) {
                                  address = value;
                                },
                                onSaved: (addactivityname) {
                                  address = addactivityname!;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                cursorColor: Color(appbarcolor),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  labelText: 'Latitude',
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(appbarcolor),
                                    ),
                                  ),
                                ),
                                validator: (val) =>
                                    val!.isEmpty ? 'Enter the Latitude' : null,
                                onChanged: (value) {
                                  lat = value;
                                },
                                onSaved: (addactivityname) {
                                  lat = addactivityname!;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                cursorColor: Color(appbarcolor),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  labelText: 'Longitude',
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(appbarcolor),
                                    ),
                                  ),
                                ),
                                validator: (val) =>
                                    val!.isEmpty ? 'Enter the Longitude' : null,
                                onChanged: (value) {
                                  lng = value;
                                },
                                onSaved: (addactivityname) {
                                  lng = addactivityname!;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                cursorColor: Color(appbarcolor),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  labelText: 'Image',
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(appbarcolor),
                                    ),
                                  ),
                                ),
                                validator: (val) =>
                                    val!.isEmpty ? 'Enter the Image' : null,
                                onChanged: (value) {
                                  image = value;
                                },
                                onSaved: (addactivityname) {
                                  image = addactivityname!;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: MaterialButton(
                                    color: Color(appbarcolor),
                                    child: Text(
                                      "Add",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () async {
                                      if (_formkey.currentState!.validate()) {
                                        setState(() {
                                          _condition = true;
                                        });
                                        dynamic result = _auth.addLocation(
                                          address,
                                          id,
                                          image,
                                          lat,
                                          lng,
                                          name,
                                          phone,
                                          region,
                                        );
                                        setState(() {
                                          _condition = false;
                                        });
                                        if (result == null) {
                                          setState(() {
                                            error =
                                                'Please register your Doctor first by contacting our team';
                                          });
                                        } else if (result != null) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            duration: Duration(seconds: 100),
                                            backgroundColor: Color(appbarcolor),
                                            content: Text(
                                                "A verification email has been sent to your email id"),
                                            action: SnackBarAction(
                                                label: "Okay",
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const HomePage()));
                                                }),
                                          ));
                                        }
                                      }
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
