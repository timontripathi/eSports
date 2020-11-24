
import 'dart:core';
import 'package:flutter/material.dart';
import 'ilogin.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  List<String> route1= ['/no','/pubg','/no','/no','/no'];
  List<String> route2= ['/fifa','/no'];
  List<String> route3= ['/no','/dota','/no','/no','/no'];


  List<String> imglist3 = ['assets/img/9.jpg','assets/img/2.jpg','assets/img/10.jpg','assets/img/4.jpg','assets/img/5.jpg'];
  List<String> imglist1 = ['assets/img/1.jpg','assets/img/3.jpg','assets/img/11.jpg','assets/img/12.jpg','assets/img/7.jpg'];
  List<String> imglist2 = ['assets/img/fifa1.jpg','assets/img/header.jpg'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191919),
      appBar: AppBar(backgroundColor: Color(0xFF121212), title: Text("eSports", style: TextStyle(fontFamily: "JosefinSans", fontSize: 32.0),),
        centerTitle: true,
      ),
      
      
      drawer: Theme(
        data: ThemeData(canvasColor: Color(0xFF202020)),
        child: new Drawer(
          child: new ListView(
            children: <Widget>[

              new UserAccountsDrawerHeader(
                accountName: new Text("Timon",style: TextStyle(fontFamily: "JosefinSans",fontSize: 20,color: Colors.white),),
                accountEmail: new Text("Timon625@gmail.com",style: TextStyle(fontFamily: "JosefinSans",fontSize: 20,color: Colors.white),),
                currentAccountPicture: new GestureDetector(
                  child: new CircleAvatar(
                    backgroundImage: new AssetImage("assets/img/6.jpg"),
                  ),
                ),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new AssetImage("assets/img/menu.jpg")
                  )
                ),
              ),


              new ListTile(
                title: new Text('Browse Tournament',style: TextStyle(fontFamily: "JosefinSans",fontSize: 22,color: Colors.white),),
                trailing: new Icon(Icons.arrow_forward_ios,color: Colors.white,size: 25,),

                onTap: () {
                  Navigator.of(context).pushNamed('/home');
                },
              ),


              new ListTile(
                title: new Text('Profile',style: TextStyle(fontFamily: "JosefinSans",fontSize: 22,color: Colors.white),),
                trailing: new Icon(Icons.perm_identity,color: Colors.white,size: 25,),
              ),

              new ListTile(
                title: new Text('My Tournament',style: TextStyle(fontFamily: "JosefinSans",fontSize: 22,color: Colors.white),),
                trailing: new Icon(Icons.gamepad,color: Colors.white,size: 25,),
              ),

              new ListTile(
                title: new Text('About',style: TextStyle(fontFamily: "JosefinSans",fontSize: 22,color: Colors.white),),
                trailing: new Icon(Icons.developer_board,color: Colors.white,size: 25,),
                onTap: () {
                  Navigator.of(context).pushNamed('/dev');
                },
              ),

              new Divider(color: Colors.white,endIndent: 100),

              new ListTile(
                title: new Text('Setting',style: TextStyle(fontFamily: "JosefinSans",fontSize: 22,color: Colors.white),),
                trailing: new Icon(Icons.settings,color: Colors.white,size: 25,),
              ),

              new ListTile(
                title: new Text('Logout',style: TextStyle(fontFamily: "JosefinSans",fontSize: 22,color: Colors.white),),
                trailing: new Icon(Icons.keyboard_return,color: Colors.white,size: 25,),
                onTap: (){
                  _showDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(9,9,9,9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[


            SizedBox(height: 5),
            Text('Trending',style: TextStyle(fontFamily: "JosefinSans",fontSize: 32,fontWeight: FontWeight.bold,color: Colors.white),),
            SizedBox(height: 3),


            Container(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imglist1.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.cyanAccent,
                    onTap: (){
                      Navigator.of(context).pushNamed(route1[index]);
                    },
                    child: _buildList1(imglist1[index].toString()),
                  );
                },
              ),
              height: MediaQuery.of(context).size.height * 0.40,
              width: MediaQuery.of(context).size.width * 1,
            ),

            SizedBox(height: 5),
            Text('Sports',style: TextStyle(fontFamily: "JosefinSans",fontSize: 32,fontWeight: FontWeight.bold,color: Colors.white),),
            SizedBox(height: 3),

            Container(
              child: PageView.builder(
                controller: PageController(viewportFraction: 0.9,),
                scrollDirection: Axis.horizontal,
                itemCount: imglist2.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      splashColor: Colors.cyanAccent,
                      onTap: (){
                        Navigator.of(context).pushNamed(route2[index]);
                      },
                      child: _buildList2(imglist2[index].toString()));
                },
              ),
              height: MediaQuery.of(context).size.height * 0.22,
              width: MediaQuery.of(context).size.width * 1,
            ),

            SizedBox(height: 5),
            Text('FPS,moba',style: TextStyle(fontFamily: "JosefinSans",fontSize: 32,fontWeight: FontWeight.bold,color: Colors.white),),
            SizedBox(height: 3),

            Container(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imglist3.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      splashColor: Colors.cyanAccent,
                      onTap: (){
                        Navigator.of(context).pushNamed(route3[index]);
                      },
                      child: _buildList3(imglist3[index].toString()));
                },
              ),
              height: MediaQuery.of(context).size.height * 0.40,
              width: MediaQuery.of(context).size.width * 1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList1(String imagePath) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        image: DecorationImage(
            fit: BoxFit.fill, image: AssetImage(imagePath)),
      ),
      height: MediaQuery.of(context).size.height * 0.40,
      width: MediaQuery.of(context).size.width * 0.40,
    );
  }

  Widget _buildList2(String imagePath) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        image: DecorationImage(
            fit: BoxFit.fill, image: AssetImage(imagePath)),
      ),
      height: MediaQuery.of(context).size.height * 0.40,
      width: MediaQuery.of(context).size.width * 0.40,
    );
  }

  Widget _buildList3(String imagePath) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        image: DecorationImage(
            fit: BoxFit.fill, image: AssetImage(imagePath)),
      ),
      height: MediaQuery.of(context).size.height * 0.40,
      width: MediaQuery.of(context).size.width * 0.40,
    );
  }


  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Are you sure you want to logout!",style: TextStyle(fontFamily: "JosefinSans",fontSize: 18),),
          backgroundColor: Colors.white,
          actions: <Widget>[
            Row(
              children: <Widget>[
                new FlatButton(
                  color: Colors.teal,
                  child:
                  new Text("Yes",style: TextStyle(fontFamily: "JosefinSans",color: Colors.white),),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
                    },
                ),
              ],
            )
          ],
        );
      },
    );
  }
  }



