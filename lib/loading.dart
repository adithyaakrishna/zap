import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

var scaffoldcolor = 0XFFE0F7FA;
var appbarcolor = 0XFF006064;

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(appbarcolor),
      child: Center(
        child: const SpinKitPouringHourGlass(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
