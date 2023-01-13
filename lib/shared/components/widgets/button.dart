import 'package:flutter/material.dart';

Widget defaultButton(
    {
      required BuildContext context,
      required String name,
      Color? color ,
      required VoidCallback onPressed
    }
    )=>Padding(
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
        child:  Text(
          name,
          style: TextStyle(
              color: color,
              fontSize: 18.0,
              fontWeight: FontWeight.w600
          ),
        ),
      )),
);