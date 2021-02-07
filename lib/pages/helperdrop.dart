import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upload_doc_app/controllers/personalController.dart';
import 'package:upload_doc_app/utils/field_data.dart';

class HelperDrop extends StatelessWidget {
  final PersonalController personalController = Get.put(PersonalController());
  final String initialValue;
  final List<String> dropDownOptions;
  final Size size;
  final int dropCount;

  HelperDrop({
    Key key,
    this.initialValue,
    this.dropDownOptions,
    this.size,
    this.dropCount,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black45,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: GetBuilder<PersonalController>(
        builder: (dropBuilder) {
          return DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: Container(
                child: DropdownButton<String>(
                  value: getDropValue(dropBuilder),
                  iconSize: 30,
                  icon: (null),
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                  hint: Text(initialValue),
                  onChanged: (val) => onDropChanged(val),
                  items: dropDownOptions?.map((item) {
                        return new DropdownMenuItem(
                          child: new Text(
                            item.toString(),
                            style: TextStyle(fontSize: size.width * 0.04),
                          ),
                          value: item.toString(),
                        );
                      })?.toList() ??
                      [],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String getDropValue(PersonalController dropBuilder) {
    if (dropCount == 1) {
      return dropBuilder.genderDropValue;
    } else if (dropCount == 2) {
      return dropBuilder.marriedDropValue;
    } else {
      return dropBuilder.qualificationDropValue;
    }
  }

  void onDropChanged(String val) {
    if (dropCount == 1) {
      personalController.changeGenderDropValue(val);
    } else if (dropCount == 2) {
      personalController.changeMarriedDropValue(val);
    } else if (dropCount == 3) {
      personalController.changeQualificationDropValue(val);
    }
  }
}
