import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  String dateOfBirth;
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime(
            selectedDate.year - 20, selectedDate.month, selectedDate.day),
        firstDate: DateTime(
            selectedDate.year - 100, selectedDate.month, selectedDate.day),
        lastDate: DateTime(
            selectedDate.year - 18, selectedDate.month, selectedDate.day));
    if (picked != null && picked != selectedDate)
      setState(() {
        dateOfBirth = dateFormat.format(picked);
        print(dateOfBirth);
      });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.025),
          child: Container(
            width: size.width * 0.7,
            height: size.height * 0.07,
            child: Center(
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black38),
                  ),
                  color: Colors.blueGrey[100],
                  onPressed: () {
                    _selectDate(context);
                  },
                  child: Text(
                    'Select Birth date',
                    style: TextStyle(color: Colors.black),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
