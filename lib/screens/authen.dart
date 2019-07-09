import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
// Explicit

// Method

  Widget showLogo() {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset(
        'images/logo.png',
      ),
    );
  }

  Widget showText() {
    return Text(
      'Jacky TPA',
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.green[900],
        fontWeight: FontWeight.bold,
        fontFamily: 'Mitr',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[showLogo(), showText()],
        ),
      ),
    );
  }
}
