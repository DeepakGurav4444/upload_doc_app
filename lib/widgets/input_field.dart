import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class InputField extends StatefulWidget {
  final Size size;
  final Widget prefix;
  final int maxLines;
  final TextEditingController textEditingController;
  final String hintText;
  final String labelText;
  final FilteringTextInputFormatter filteringTextInputFormatter;
  final LengthLimitingTextInputFormatter lengthLimitingTextInputFormatter;
  final IconData icon;
  final TextInputType textInputType;
  final String Function(String) validator;
  const InputField(
      {Key key,
      this.size,
      this.textEditingController,
      this.hintText,
      this.labelText,
      this.filteringTextInputFormatter,
      this.icon,
      this.textInputType,
      this.lengthLimitingTextInputFormatter,
      this.validator,
      this.prefix, this.maxLines})
      : super(key: key);
  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  TextEditingController _fullNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        widget.filteringTextInputFormatter,
        widget.lengthLimitingTextInputFormatter
      ],
      controller: _fullNameController,
      validator: widget.validator,
      keyboardType: TextInputType.text,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        prefix: widget.prefix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        labelText: widget.labelText,
        hintText: widget.hintText,
        icon: Icon(widget.icon),
      ),
    );
  }
}