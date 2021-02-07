import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PersonalController extends GetxController {
  var genderDropValue;
  var marriedDropValue;
  var qualificationDropValue;

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  String dateOfBirth;
  DateTime selectedDate = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime(
            selectedDate.year - 20, selectedDate.month, selectedDate.day),
        firstDate: DateTime(
            selectedDate.year - 100, selectedDate.month, selectedDate.day),
        lastDate: DateTime(
            selectedDate.year - 18, selectedDate.month, selectedDate.day));
    if (picked != null && picked != selectedDate)
      dateOfBirth = dateFormat.format(picked);
    update();
    print(dateOfBirth);
  }

  void changeGenderDropValue(String genderValue) {
    genderDropValue = genderValue;
    update();
  }

  void changeMarriedDropValue(String marriedValue) {
    marriedDropValue = marriedValue;
    update();
  }

  void changeQualificationDropValue(String qualificationValue) {
    qualificationDropValue = qualificationValue;
    update();
  }

  bool validateFields() {
    if (genderDropValue != null &&
        marriedDropValue != null &&
        qualificationDropValue != null &&
        dateOfBirth != null) return true;
    return false;
  }
}
