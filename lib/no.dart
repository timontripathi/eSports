import 'package:flutter/material.dart';

class NoTournament extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF262626),
      appBar: AppBar(
        backgroundColor: Color(0xFF181818),
        title: Text('Tournaments',style: TextStyle(fontFamily: "JosefinSans",fontSize: 25.0),),
      ),
      body: Center(child: Text('No Tournament Available',style: TextStyle(fontFamily: "JosefinSans",fontSize: 22.0))),
    );
  }
}
