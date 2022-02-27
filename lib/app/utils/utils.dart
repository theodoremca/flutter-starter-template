import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


import 'country_cities.dart';

class Utils {
  static bool production = !false;
  static void offKeyboard() async {
    await SystemChannels.textInput.invokeMethod<dynamic>('TextInput.hide');
  }
  static String? isValidPassword(String value) {
    value = value.trim();
    if (value.trim().isEmpty) {
      return "Password is required";
    } else if (value.trim().length < 6) {
      return "Password is too short";
    } else if (!value.trim().contains(RegExp(r'[0-9]'))) {
      return "Password must contain a number";
    } else if (!value.trim().toUpperCase().contains(RegExp(r'[A-Z]'))) {
      return "Password must contain a letter";
    }
    return null;
  }
  static String? isValidName(String value) {
    if (value.isEmpty) {
      return 'Field cannot be Empty';
    }
    return null;
  }
  static String? validateEmail(String value) {
    value = value.trim();
    final RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!regex.hasMatch(value)) {
      return 'Enter valid email';
    } else {
      return null;
    }
  }
  static String todaysDate( ) {
    return DateFormat('MMMM dd').format(DateTime.now());
  }

  static String subString(String string,{int? start, int? end}) {
    int _start = start ?? 0;
    int _end = string.length-1>(end??string.length)?end??string.length:string.length;
    return   string.substring(_start,_end);
  }

  static String toDate(String date) {

    return DateFormat('MMMM dd').format(DateTime.parse(date));
  }
  static void unfocusKeyboard(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
      return;
    }
    currentFocus.unfocus();
  }
}
