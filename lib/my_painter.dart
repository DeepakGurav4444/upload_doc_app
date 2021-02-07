import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas,Size size) {

    Paint paint = Paint();
    Path ovalPath = Path();
    // canvas.drawPath(backPath, backPaint);
    ovalPath.moveTo(0, 0);
    ovalPath.lineTo(0, size.height * 0.2);
    ovalPath.quadraticBezierTo(size.width * 0.25, size.height * 0.35,
        size.width * 0.5, size.height * 0.35);
    ovalPath.quadraticBezierTo(
        size.width * 0.75, size.height * 0.35, size.width, size.height * 0.2);
    ovalPath.lineTo(size.width, 0);
    ovalPath.close();
    paint.color = Colors.blue;
    canvas.drawPath(ovalPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw oldDelegate != this;
  }
}
