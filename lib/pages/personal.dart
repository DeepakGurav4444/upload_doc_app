import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:upload_doc_app/controllers/formcontroller.dart';
import 'package:upload_doc_app/controllers/personalController.dart';
import 'package:upload_doc_app/pages/helperField.dart';
import 'package:upload_doc_app/utils/field_data.dart';
import 'package:upload_doc_app/utils/validators.dart';
import 'package:upload_doc_app/widgets/input_field.dart';

import 'helperdrop.dart';

class Personal extends StatelessWidget {
  final personalController = Get.put(PersonalController());
  final formController = FormController();
  final Size size;
  Personal({Key key, this.size}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController fullNameController = TextEditingController();
    // DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    // String dateOfBirth;
    // DateTime selectedDate = DateTime.now();
    // Future<void> _selectDate(BuildContext context) async {
    //   final DateTime picked = await showDatePicker(
    //       context: context,
    //       initialDate: DateTime(
    //           selectedDate.year - 20, selectedDate.month, selectedDate.day),
    //       firstDate: DateTime(
    //           selectedDate.year - 100, selectedDate.month, selectedDate.day),
    //       lastDate: DateTime(
    //           selectedDate.year - 18, selectedDate.month, selectedDate.day));
    //   if (picked != null && picked != selectedDate)
    //     // setState(() {
    //     //   dateOfBirth = dateFormat.format(picked);
    //     //   print(dateOfBirth);
    //     // });
    //     dateOfBirth = dateFormat.format(picked);
    //   print(dateOfBirth);
    // }

    return Container(
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.025, vertical: size.height * 0.035),
            child: StreamBuilder<String>(
                stream: formController.fullName,
                builder: (context, snapshot) {
                  return HelperField(
                    size: size,
                    errorText: snapshot.error,
                    maxLines: 1,
                    onChanged: formController.nameChanged,
                    prefix: null,
                    // textEditingController: fullNameController,
                    labelText: "Full Name",
                    hintText: "Full Name",
                    filteringTextInputFormatter: FilteringTextInputFormatter(
                        RegExp("[a-zA-Z ]"),
                        allow: true),
                    lengthLimitingTextInputFormatter:
                        LengthLimitingTextInputFormatter(25),
                    icon: FontAwesome.user_o,
                    textInputType: TextInputType.text,
                    // validator: Validators.nameValidator)
                  );
                }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.025, vertical: size.height * 0.035),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  HelperDrop(
                    initialValue: FieldData.genderInitial,
                    dropDownOptions: FieldData.gendersList,
                    size: size,
                    dropCount: 1,
                  ),
                  HelperDrop(
                    initialValue: FieldData.marriedInitial,
                    dropDownOptions: FieldData.marriedList,
                    size: size,
                    dropCount: 2,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.025, vertical: size.height * 0.035),
            child: GetBuilder<PersonalController>(builder: (dateBuilder) {
              return dateBuilder.dateOfBirth != null
                  ? Container(
                      width: size.width * 0.75,
                      height: size.height * 0.07,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black38),
                        ),
                        color: Colors.blueGrey[100],
                        onPressed: () async {
                          await personalController.selectDate(context);
                        },
                        child: Text(
                          '${dateBuilder.dateOfBirth}',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                  : Container(
                      width: size.width * 0.75,
                      height: size.height * 0.07,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black38),
                        ),
                        color: Colors.blueGrey[100],
                        onPressed: () async {
                          await personalController.selectDate(context);
                        },
                        child: Text(
                          'Select Birth date',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
            }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.035),
            child: Container(
              width: size.width * 0.75,
              child: HelperDrop(
                initialValue: FieldData.qualificationInitial,
                dropDownOptions: FieldData.qualificationList,
                size: size,
                dropCount: 3,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.025,
              vertical: size.height * 0.025,
            ),
            child: StreamBuilder<bool>(
                stream: formController.personalCheck,
                builder: (context, snapshot) {
                  return Container(
                    height: size.height * 0.05,
                    width: size.height * 0.05,
                    alignment: Alignment.centerRight,
                    child: MaterialButton(
                      onPressed: !snapshot.hasData ||
                              !personalController.validateFields()
                          ? null
                          : () {
                              print("Validated");
                            },
                      color: Colors.lightBlueAccent,
                      textColor: Colors.white,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: size.height * 0.02,
                      ),
                      shape: CircleBorder(),
                    ),
                  );
                }),
          )
        ],
      )),
    );
  }
}
