import 'package:flutter/material.dart';
import 'package:upload_doc_app/utils/field_data.dart';


class DropDownButtons extends StatefulWidget {
  final List<String> dropDownOptions;
  final String initialValue;
  final String dropDownValue;
  final Size size;

  const DropDownButtons(
      {Key key, @required this.dropDownOptions, @required this.dropDownValue, this.size, this.initialValue})
      : super(key: key);
  @override
  _DropDownButtonsState createState() => _DropDownButtonsState();
}

class _DropDownButtonsState extends State<DropDownButtons> {
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
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: Container(
            child: DropdownButton<String>(
              value: widget.dropDownValue,
              iconSize: 30,
              icon: (null),
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
              hint: Text(widget.initialValue),
              onChanged: (String newValue) {
                setState(() {
                  FieldData.genderDropValue = newValue;
                  // loadStateNames();
                  print(newValue);
                });
              },
              items: widget.dropDownOptions?.map((item) {
                    return new DropdownMenuItem(
                      child: new Text(item.toString(),style: TextStyle(fontSize: widget.size.width*0.04),),
                      value: item.toString(),
                    );
                  })?.toList() ??
                  [],
            ),
          ),
        ),
      ),
    );
  }
}
