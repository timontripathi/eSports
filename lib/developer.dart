import 'package:flutter/material.dart';


class DeveloperMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text(
          'About',style: TextStyle(fontSize: 25.0,fontFamily: "JosefinSans"),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height *1.0,
        decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/img/me.jpg'))
        ),
        ),
      );
  }
}
