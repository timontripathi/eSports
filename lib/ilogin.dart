import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:async';
import 'home.dart';

void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new LoginPage(),
    );
  }
}


class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {


  // TextEditingController email = new TextEditingController();
  // TextEditingController password = new TextEditingController();
  //
  // Future<bool>_login() async {
  //   final response = await http.post("http://192.168.43.106/api/Api.php?apicall=login" ,body:{
  //     "gaming_name": email.text,
  //     "password":password.text,
  //   });
  //   Map<String,dynamic> result = jsonDecode(response.body);
  //   print(result['error']);
  //   return  Future.value(result['error']);
  // }


  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  // void initState() {
  //   super.initState();
  //   _iconAnimationController = new AnimationController(
  //       value: this, duration: new Duration(milliseconds: 500));
  //   _iconAnimation = new CurvedAnimation(
  //     parent: _iconAnimationController,
  //     curve: Curves.bounceOut,
  //   );
  //   _iconAnimation.addListener(() => this.setState(() {}));
  //   _iconAnimationController.forward();
  // }

  @override
  Widget build(BuildContext context) {
    bool resultState;
    return new Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: new Stack(
          children: <Widget>[
            new Image(
              image: new AssetImage("assets/img/login.jpg"),
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.darken,
              color: Colors.black45,
            ),
          new Theme(
            data: new ThemeData(
                brightness: Brightness.dark,
                inputDecorationTheme: new InputDecorationTheme(
                  labelStyle:
                  new TextStyle(color: Colors.tealAccent, fontSize: 25.0, fontFamily: 'JosefinSans', fontWeight: FontWeight.w400),
                )),

            isMaterialAppTheme: true,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                new MaterialButton(
                  height: 200.0,
                  onPressed: (){},
                  child: new Text(
                    "eSports",
                    style: new TextStyle(
                      fontSize: 40.0,
                      fontFamily: 'JosefinSans',
                      fontWeight: FontWeight.w400,
                      color: Colors.tealAccent,
                    ),
                  ),
                  splashColor: Colors.black,
                ),


                new Container(
                  padding: const EdgeInsets.all(40.0),
                  child: new Form(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        new TextFormField(
                          // controller: email,
                          decoration: new InputDecoration(
                              labelText: "Gaming name", fillColor: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        new TextFormField(
                          // controller: password,
                          decoration: new InputDecoration(
                            labelText: "Enter Password",
                          ),
                          obscureText: true,
                          keyboardType: TextInputType.text,
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 60.0),
                        ),

                        new MaterialButton(
                          height: 50.0,
                          minWidth: 150.0,
                          color: Colors.teal,
                          splashColor: Colors.teal,
                          textColor: Colors.white,
                          child: new Text("Login"),
                          onPressed:()  {
                            // _login().then((val){
                            //   setState(() {
                            //     resultState=val;
                            //     print(resultState);
                            //   });
                            //   if (resultState == false) {
                                Navigator.of(context).pushReplacementNamed('/home');
                            //   }
                            //   else {
                            //     return _showDialog(context);
                            //   }
                            // });
                            // // ignore: unrelated_type_equality_checks
                          },
                        )
                      ],
                    ),
                  ),
                ),
            Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'New to this app ?',
                style: TextStyle(color: Colors.white, fontFamily: 'JosefinSans', fontWeight: FontWeight.w400),
              ),
              SizedBox(width: 5.0),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/signup');
                  },
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.tealAccent,
                      fontFamily: 'JosefinSans',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          )
              ],
            ),
          ),
          SizedBox(height: 15.0),
        ],
        ),
      ));
  }


  // void _showDialog(BuildContext context) {
  //   // flutter defined function
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       // return object of type Dialog
  //       return AlertDialog(
  //         title: new Text("The Password or Username is Incorrect!",style: TextStyle(fontFamily: "JosefinSans",fontSize: 18),),
  //         backgroundColor: Colors.white,
  //         actions: <Widget>[
  //           Row(
  //             children: <Widget>[
  //               new FlatButton(
  //                 color: Colors.teal,
  //                 child:
  //                 new Text("Okay",style: TextStyle(fontFamily: "JosefinSans",color: Colors.white),),
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //               ),
  //             ],
  //           )
  //         ],
  //       );
  //     },
  //   );
  // }
}



