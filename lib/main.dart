import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zap/screens/HomeScreen.dart';

import 'screens/LoginScreen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// class Splash2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SplashScreen(
//       seconds: 5,
//       navigateAfterSeconds: new MapScreen(),
//       title: new Text(
//         'Zap',
//         textScaleFactor: 2,
//       ),
//       image: new Image.network(
//           'https://raw.githubusercontent.com/adithyaakrishna/rh-ts-bot/main/src/assets/EV-F.png'),
//       loadingText: Text("Loading"),
//       photoSize: 100.0,
//       loaderColor: Colors.blue,
//     );
//   }
// }

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Zap")),
      body: Center(
          child: Text(
        "Home Page",
        textScaleFactor: 2,
      )),
    );
  }
}
