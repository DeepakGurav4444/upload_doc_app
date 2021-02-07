import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:upload_doc_app/utils/field_data.dart';
import 'package:upload_doc_app/utils/validators.dart';
import 'package:upload_doc_app/widgets/drop_down_buttons.dart';
import 'package:upload_doc_app/widgets/input_field.dart';

class PersonalDetails extends StatefulWidget {
  final Size size;

  const PersonalDetails({Key key, this.size}) : super(key: key);
  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  TextEditingController _fullNameController = TextEditingController();
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
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: widget.size.width * 0.025,
                    vertical: widget.size.height * 0.035),
                child: InputField(
                  size: widget.size,
                  textEditingController: _fullNameController,
                  hintText: "Enter Full Name",
                  labelText: "Full Name",
                  prefix: null,
                  filteringTextInputFormatter: FilteringTextInputFormatter(
                      RegExp("[a-zA-Z ]"),
                      allow: true),
                  icon: FontAwesome.user_o,
                  textInputType: TextInputType.text,
                  lengthLimitingTextInputFormatter:
                      LengthLimitingTextInputFormatter(25),
                  // validator: Validators.nameValidator),
                )),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: widget.size.width * 0.025,
                  vertical: widget.size.height * 0.035),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    DropDownButtons(
                      initialValue: FieldData.genderInitial,
                      dropDownOptions: FieldData.gendersList,
                      dropDownValue: FieldData.genderDropValue,
                      size: widget.size,
                    ),
                    DropDownButtons(
                      initialValue: FieldData.marriedInitial,
                      dropDownOptions: FieldData.marriedList,
                      dropDownValue: FieldData.marriedDropStatus,
                      size: widget.size,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: widget.size.width * 0.025,
                  vertical: widget.size.height * 0.035),
              child: Container(
                width: widget.size.width * 0.75,
                height: widget.size.height * 0.07,
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
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: widget.size.height * 0.035),
              child: Container(
                width: widget.size.width * 0.75,
                child: DropDownButtons(
                  initialValue: FieldData.qualificationInitial,
                  dropDownOptions: FieldData.qualificationList,
                  dropDownValue: FieldData.qualificationValue,
                  size: widget.size,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
