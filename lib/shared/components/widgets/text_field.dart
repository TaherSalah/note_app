import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
   const CustomFormField({Key? key, required this.hint,  this.maxLines=1}) : super(key: key);
  final String hint;
  final int maxLines;
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children:  [

          const SizedBox(height:20 ,),
          TextField(
            maxLines: maxLines,
            cursorColor: Colors.amber,
            decoration: InputDecoration(
              hintText: hint,

              focusColor: Colors.amber,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.amber,
                )),
              enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color:Colors.amber, )),

            ),
          ),

        ],
      ),
    );
  }
}
