import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upload_doc_app/utils/field_data.dart';

class HelperField extends StatelessWidget {
  final Size size;
  final Widget prefix;
  final int maxLines;
  // final TextEditingController textEditingController;
  final String hintText;
  final String errorText;
  final Function(Object)onChanged;
  final String labelText;
  final FilteringTextInputFormatter filteringTextInputFormatter;
  final LengthLimitingTextInputFormatter lengthLimitingTextInputFormatter;
  final IconData icon;
  final TextInputType textInputType;
  // final String Function(String) validator;

  const HelperField(
      {Key key,
      this.size,
      this.prefix,
      this.maxLines,
      // this.textEditingController,
      this.hintText,
      this.labelText,
      this.filteringTextInputFormatter,
      this.lengthLimitingTextInputFormatter,
      this.icon,
      this.textInputType,
      this.onChanged, this.errorText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        filteringTextInputFormatter,
        lengthLimitingTextInputFormatter
      ],
      // controller: textEditingController,
      // validator: validator,
      onChanged: onChanged,
      keyboardType: TextInputType.text,
      maxLines: maxLines,
      decoration: InputDecoration(
        errorText: errorText,
        prefix: null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        labelText: labelText,
        hintText: hintText,
        icon: Icon(icon),
      ),
    );
  }
}
// class HelperField {
//   static Widget getTextField(
//           Size size,
//           Widget prefix,
//           int maxLines,
//           TextEditingController textEditingController,
//           String hintText,
//           String labelText,
//           FilteringTextInputFormatter filteringTextInputFormatter,
//           LengthLimitingTextInputFormatter lengthLimitingTextInputFormatter,
//           IconData icon,
//           TextInputType textInputType,
//           String Function(String) validator) =>
//       TextFormField(
//         inputFormatters: [
//           filteringTextInputFormatter,
//           lengthLimitingTextInputFormatter
//         ],
//         controller: textEditingController,
//         validator: validator,
//         keyboardType: TextInputType.text,
//         maxLines: maxLines,
//         decoration: InputDecoration(
//           prefix: null,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           labelText: labelText,
//           hintText: hintText,
//           icon: Icon(icon),
//         ),
//       );
//   static Widget getDropDown(String initialValue,List<String> dropDownOptions,
//           String dropDownValue, Size size) =>
//       Container(
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: Colors.black45,
//           ),
//           borderRadius: BorderRadius.all(
//             Radius.circular(15),
//           ),
//         ),
//         child: DropdownButtonHideUnderline(
//           child: ButtonTheme(
//             alignedDropdown: true,
//             child: Container(
//               child: DropdownButton<String>(
//                 value: dropDownValue,
//                 iconSize: 30,
//                 icon: (null),
//                 style: TextStyle(
//                   color: Colors.black54,
//                   fontSize: 16,
//                 ),
//                 hint: Text(initialValue),
//                 onChanged: (String newValue) {
//                   // setState(() {
//                   FieldData.genderDropValue = newValue;
//                   // loadStateNames();
//                   print(newValue);
//                   // });
//                 },
//                 items: dropDownOptions?.map((item) {
//                       return new DropdownMenuItem(
//                         child: new Text(
//                           item.toString(),
//                           style: TextStyle(fontSize: size.width * 0.04),
//                         ),
//                         value: item.toString(),
//                       );
//                     })?.toList() ??
//                     [],
//               ),
//             ),
//           ),
//         ),
//       );
// }
