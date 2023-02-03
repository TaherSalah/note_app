import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


///////// Start Show Toast Method /////////////////////
void showToast({String? text, required ToastStates state
  // required toastStates state
}) =>
    Fluttertoast.showToast(
        msg: text!,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: choseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);
///////// Start Enum Toast States /////////////////////
enum ToastStates { success, error, warning }
// ignore: body_might_complete_normally_nullable
///////// Start choseToastColor Switch /////////////////////
Color? choseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = Colors.amber;
  }
  return color;
}
