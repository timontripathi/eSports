import 'package:esports/no.dart';
import 'package:esports/signup.dart';
import 'package:flutter/material.dart';
import 'developer.dart';
import 'splash.dart';
import 'home.dart';
import 'ilogin.dart';
import 'pubg.dart';
import 'fifa.dart';
import 'dota.dart';
import 'no.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


void main(){
  runApp(new MaterialApp(
    theme: ThemeData(primaryColor: Colors.redAccent, accentColor:   Colors.black ),
    debugShowCheckedModeBanner: false,
    routes: <String, WidgetBuilder>{
      '/signup':(BuildContext context) =>  SignupPage(),
      '/home' :(BuildContext context) => HomePage(),
      '/login' :(BuildContext context) => LoginPage(),
      '/pubg' :(BuildContext context) => PubData(),
      '/no' :(BuildContext context) => NoTournament(),
      '/fifa' :(BuildContext context) => FifaData(),
      '/dota' :(BuildContext context) => DotaData(),
      '/dev' :(BuildContext context) => DeveloperMe(),
    },
    home: LandingPage(),
  ));
}

class NotifiCation extends StatefulWidget {
  @override
  _NotifiCationState createState() => _NotifiCationState();
}

class _NotifiCationState extends State<NotifiCation> {

  final FirebaseMessaging _messaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();

    _messaging.getToken().then((token) {
      print(token);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
