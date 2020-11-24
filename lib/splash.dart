import 'package:flutter/material.dart';
import 'dart:async';
import 'ilogin.dart';

class LandingPage extends StatefulWidget {
  @override
  State createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () =>
        onDoneLoading());
  }
  onDoneLoading() async {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,

        children: <Widget>[
          Container(
            decoration: new BoxDecoration(image: new DecorationImage(
                image: AssetImage('assets/img/splash.jpg'))),
          )
        ],
      ),
    );
  }

}