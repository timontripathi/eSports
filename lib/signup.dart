import 'dart:convert';
import 'package:http/http.dart'as http;
import 'dart:async';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

TextEditingController gaming_name = new TextEditingController();
TextEditingController email = new TextEditingController();
TextEditingController password = new TextEditingController();
TextEditingController phone_no = new TextEditingController();
TextEditingController address = new TextEditingController();

Future<bool>_signup() async {
  final response = await http.post("http://192.168.43.106/api/Api.php?apicall=signup" ,body:{
    "gaming_name": gaming_name.text,
    "email": email.text,
    "password": password.text,
    "phone_no": phone_no.text,
    "address": address.text,
  });
  Map<String,dynamic> result = jsonDecode(response.body);
  print(result);
}


class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
        body:SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              new Image(
                image: new AssetImage("assets/img/login.jpg"),
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.darken,
                color: Colors.black45,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
                  Widget>[
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(5.0, 50.0, 0.0, 0.0),
                        child: Text(
                          'eSports',
                          style:
                          TextStyle(color: Colors.tealAccent, fontSize: 40.0, fontFamily: 'JosefinSans', fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: gaming_name,
                          decoration: InputDecoration(
                              labelText: 'Gaming name',
                              labelStyle: TextStyle(
                                  fontFamily: 'JosefinSans',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.tealAccent),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.tealAccent))),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                  fontFamily: 'JosefinSans',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.tealAccent),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.tealAccent))),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: password,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  fontFamily: 'JosefinSans',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.tealAccent),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.tealAccent))),
                          obscureText: true,
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: phone_no,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Phone no',
                              labelStyle: TextStyle(
                                  fontFamily: 'JosefinSans',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.tealAccent),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.tealAccent))),
                        ),
                        SizedBox(height: 10.0),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: address,
                          decoration: InputDecoration(
                              labelText: 'Address',
                              labelStyle: TextStyle(
                                  fontFamily: 'JosefinSans',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.tealAccent),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.tealAccent))),
                        ),
                        SizedBox(height: 80.0),
                        Container(
                            height: 40.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.teal,
                              elevation: 7.0,
                              child: GestureDetector(
                                onTap: () {
                                  _signup();
                                  Navigator.of(context).pop();
                                },
                                child: Center(
                                  child: Text(
                                    'SIGNUP',
                                    style: TextStyle(
                                        color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'JosefinSans'),
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(height:20.0),
                        Container(
                          child: Container(
                            height: 40.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0)),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child:
                              Center(
                                child: Text('Back',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'JosefinSans')),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ])
            ],
          ),
        ),
        );
  }


}