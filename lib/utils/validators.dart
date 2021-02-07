//To Validate TextFields
import 'dart:async';

import 'package:string_validator/string_validator.dart';

mixin Validators {
  // static String nameValidator(String name) {
  //   if (name.isEmpty) {
  //     return "Field should not Empty";
  //   } else if (!isAlpha(name.replaceAll(' ', ''))) {
  //     return "Enter Valid Full Name";
  //   } else if (!name.contains(' ')) {
  //     return "Enter Valid Full Name";
  //   } else {
  //     return null;
  //   }
  // }

  // static String onDropChanged(String val) {
  //   if (val = null) {
  //     return val;
  //   }
  //   return null;
  // }

  var nameValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.isEmpty) {
      sink.addError("Enter Full Name");
    } else if (!isAlpha(name.replaceAll(' ', '')) || !name.contains(' ')) {
      sink.addError("Enter Valid Full Name");
    } else {
      sink.add(name);
    }
  });
}
