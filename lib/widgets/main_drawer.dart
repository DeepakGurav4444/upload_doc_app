import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:upload_doc_app/pages/test_page.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.all(size.height * 0.025),
                child: Container(
                    child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Deepak Gurav",
                                    style: TextStyle(
                                        fontSize: size.height * 0.025,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Manage profile & settings",
                                    style: TextStyle(
                                        fontSize: size.height * 0.015),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: ClipOval(
                              child: IconButton(
                                  icon: Icon(Icons.person), onPressed: () {}),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildTxtButton("Saved", size),
                  buildTxtButton("Favourites", size),
                  buildTxtButton("Interests", size),
                  buildTxtButton("Friends", size),
                ],
              ),
            ),
            ListTile(
              onTap: () async{
                Navigator.pop(context);
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (c, a1, a2) => TestPage(),
                    transitionsBuilder: (c, anim, a2, child) =>
                        FadeTransition(opacity: anim, child: child),
                    transitionDuration: Duration(milliseconds: 500),
                  ),
                );
              },
              leading: Icon(Icons.home),
              title: Text('Home'),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(MaterialCommunityIcons.newspaper),
              title: Text('News'),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.work),
              title: Text('Carries'),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(FontAwesome.area_chart),
              title: Text('History'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTxtButton(String txt, Size size) => GestureDetector(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 1, color: Colors.grey)),
          height: size.height * 0.045,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
            child: Text(
              '$txt',
              style: TextStyle(
                  fontSize: size.height * 0.020, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        onTap: () {},
      );
}
