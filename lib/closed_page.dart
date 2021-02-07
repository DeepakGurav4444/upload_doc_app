import 'package:flutter/material.dart';
class ClosedPage extends StatefulWidget {
  @override
  _ClosedPageState createState() => _ClosedPageState();
}

class _ClosedPageState extends State<ClosedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("This is Closed Page"),
      ),
    );
  }
}