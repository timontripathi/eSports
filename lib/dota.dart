import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class Dota {
  final String id;
  final String heading, start_time, mode, schedule, requirement, rule;

  Dota(
      {this.id,
      this.heading,
      this.start_time,
      this.mode,
      this.schedule,
      this.requirement,
      this.rule});

  factory Dota.fromJson(Map<String, dynamic> jsondata) {
    return Dota(
      id: jsondata['id'],
      heading: jsondata['heading'],
      start_time: jsondata['start_time'],
      mode: jsondata['mode'],
      schedule: jsondata['schedule'],
      requirement: jsondata['requirement'],
      rule: jsondata['rule'],
    );
  }
}

class DotaData extends StatefulWidget {
  @override
  _DotaDataState createState() => _DotaDataState();
}

class _DotaDataState extends State<DotaData> {
  final String url = "http://192.168.43.106/api/dota.php";
  List data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191919),
      appBar: AppBar(
        title: Text('Tournaments',
            style: TextStyle(fontFamily: "JosefinSans", fontSize: 25.0)),
        backgroundColor: Color(0xFF121212),
      ),
      body: FutureBuilder(
        future: downloadJSON(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.none:
              return Container();
              break;
            case ConnectionState.active:
              return Container();
              break;
            case ConnectionState.done:
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 9, 0, 9),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Dota dota = snapshot.data[index];
                    return ListTile(
                      leading: CircleAvatar(
                          child: Image(
                              image:
                                  new AssetImage("assets/img/dotaicon.jpg"))),
                      title: Text(
                        dota.start_time,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      subtitle: Text(dota.heading,
                          style: TextStyle(
                              color: Color(0xFFE0F2F1), fontSize: 17.0)),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DotaDetail(detail: dota,)));
                      },
                    );
                  },
                ),
              );
           }
          ;
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    this.downloadJSON();
  }

  Future<List<Dota>> downloadJSON() async {
    final jsonEndpoint = "http://192.168.43.106/api/dota.php";
    final response = await get(jsonEndpoint);
    if (response.statusCode == 200) {
      List dota = jsonDecode(response.body);
      print(dota.toString());
      return dota.map((dota) => new Dota.fromJson(dota)).toList();
    } else
      throw Exception('we were not able to succesfully download the json data');
  }
}

class DotaDetail extends StatefulWidget {
  Dota detail;

  DotaDetail({this.detail});

  @override
  _DotaDetailState createState() => _DotaDetailState();
}

class _DotaDetailState extends State<DotaDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191919),
      appBar: AppBar(
        title: Text(widget.detail.heading,
            style: TextStyle(
                fontSize: 22,
                color: Colors.greenAccent,
                fontFamily: "JosefinSans")),
        backgroundColor: Color(0xFF121212),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  '  Date',
                  style: TextStyle(fontSize: 25, color: Colors.white,fontFamily: "JosefinSans"),
                ),
                Text(
                  ' Time',
                  style: TextStyle(fontSize: 25, color: Colors.white,fontFamily: "JosefinSans"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  widget.detail.start_time.substring(0, 10),
                  style: TextStyle(fontSize: 22, color: Colors.cyanAccent,fontFamily: "JosefinSans"),
                ),
                Text(
                  returnTime(widget.detail.start_time.substring(11, 16)),
                  style: TextStyle(fontSize: 22, color: Colors.cyanAccent,fontFamily: "JosefinSans"),
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              children: <Widget>[
                Text('Mode :  ',style: TextStyle(fontFamily: "JosefinSans",fontSize: 25,color: Colors.red)),
                Text(widget.detail.mode,style: TextStyle(fontFamily: "JosefinSans",fontSize: 22,color: Colors.white)),
              ],
            ),
            SizedBox(height: 25),
            Row(
              children: <Widget>[
                Text('Schedule :',style: TextStyle(fontFamily: "JosefinSans",fontSize: 25,color: Colors.red)),
              ],
            ),
            SizedBox(height: 6),
            Row(
              children: <Widget>[
                Text(widget.detail.schedule,style: TextStyle(fontFamily: "JosefinSans",fontSize: 22,color: Colors.white)),
              ],
            ),
            SizedBox(height: 25,),
            Row(
              children: <Widget>[
                Text('Requirement :',style: TextStyle(fontFamily: "JosefinSans",fontSize: 25,color: Colors.red)),
              ],
            ),
            SizedBox(height: 6,),
            Wrap(
              children: <Widget>[
                Text(widget.detail.requirement,style: TextStyle(fontFamily: "JosefinSans",fontSize: 22,color: Colors.white)),
              ],
            ),
            SizedBox(height: 25,),
            Row(
              children: <Widget>[
                Text('Quick Rules :',style: TextStyle(fontFamily: "JosefinSans",fontSize: 25,color: Colors.red)),
              ],
            ),
            SizedBox(height: 6,),
            Wrap(
              children: <Widget>[
                Text(widget.detail.rule,style: TextStyle(fontFamily: "JosefinSans",fontSize: 22,color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


String returnTime(String time) {

  String timeString;
  int hoursInt=int.parse(time.substring(0,2));
  int minInt=int.parse(time.substring(3,5));

  if(hoursInt>12){
    timeString= '${hoursInt-12}:$minInt PM';
  }
  else{
    timeString='$hoursInt:$minInt AM';
  }

  return timeString;
}
