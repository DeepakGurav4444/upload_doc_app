import 'package:flutter/material.dart';
import 'package:upload_doc_app/pages/personal.dart';

class Register extends StatelessWidget {
  const Register({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int slideIndex = 0;
    PageController controller;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05, vertical: size.height * 0.05),
              child: Center(
                child: Text(
                  "Registeration Form",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: size.height * 0.035,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            WillPopScope(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[100],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                height: size.height * 0.7,
                width: size.width * 0.85,
                child: PageView(
                  children: <Widget>[
                    Personal(
                      size: size,
                    ),
                  ],
                  controller: controller,
                  onPageChanged: (index) {},
                ),
              ),
              onWillPop: () async {
                return;
              },
            )
          ],
        ),
      ),
    );
  }
}
