import 'package:flutter/material.dart';
import 'package:upload_doc_app/my_painter.dart';

class CustomDeesign extends StatefulWidget {
  @override
  _CustomDeesignState createState() => _CustomDeesignState();
}

class _CustomDeesignState extends State<CustomDeesign> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          fit: StackFit.loose,
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: size.height,
              width: size.width,
              child: CustomPaint(
                painter: MyPainter(),
              ),
            ),
            Positioned(
              top: size.height * 0.4,
              child: Container(
                alignment: Alignment.center,
                width: size.width,
                height: size.height * 0.05,
                child: TextButton(
                  child: Text("Camrera Here"),
                  onPressed: () {},
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.5,
              child: Container(
                alignment: Alignment.center,
                width: size.width,
                height: size.height * 0.05,
                child: Text("My Name is Deepak"),
              ),
            ),
            Positioned(
              top: size.height * 0.6,
              child: Container(
                alignment: Alignment.center,
                width: size.width,
                height: size.height * 0.05,
                child: Text("My Name is Deepak"),
              ),
            ),
            // Positioned(
            //   top: size.height * 0.7,
            //   child: Container(
            //     alignment: Alignment.center,
            //     width: size.width,
            //     height: size.height * 0.05,
            //     child: Text("My Name is Deepak"),
            //   ),
            // ),
            // Positioned(
            //   top: size.height * 0.8,
            //   child: Container(
            //     alignment: Alignment.center,
            //     width: size.width,
            //     height: size.height * 0.05,
            //     child: Text("My Name is Deepak"),
            //   ),
            // ),
            // Positioned(
            //   top: size.height * 0.9,
            //   child: Container(
            //     alignment: Alignment.center,
            //     width: size.width,
            //     height: size.height * 0.05,
            //     child: Text("My Name is Deepak"),
            //   ),
            // ),
            // Positioned(
            //   top: size.height,
            //   child: Container(
            //     alignment: Alignment.center,
            //     width: size.width,
            //     height: size.height * 0.05,
            //     child: Text("My Name is Deepak"),
            //   ),
            // ),
            // Positioned(
            //   top: size.height * 1.1,
            //   child: Container(
            //     alignment: Alignment.center,
            //     width: size.width,
            //     height: size.height * 0.05,
            //     child: Text("My Name is Deepak"),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
