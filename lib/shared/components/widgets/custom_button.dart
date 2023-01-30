import 'package:flutter/material.dart';

import '../../style/constance.dart';

Widget defaultButton(
        {required BuildContext context,
        required String name,
        Color? color,
        required VoidCallback onPressed}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
          height: 67,
          width: 353,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(19),
            color: Colors.amber.withOpacity(0.8),
          ),
          child: MaterialButton(
            onPressed: onPressed,
            child: Text(
              name,
              style: TextStyle(
                  color: color, fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
          )),
    );

Widget buttonElevated({
  VoidCallback? onPress,
  required String label,
}) {
  return ElevatedButton(
    onPressed: onPress,
    style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryLightColor,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 13),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
    child: Text(
      label,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: 'cairo',
      ),
    ),
  );
}
