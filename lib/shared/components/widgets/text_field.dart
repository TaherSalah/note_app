import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({Key? key, required this.hint, this.maxLines = 1, this.onSaved, this.onChanged, this.validator})
      : super(key: key);

  final String hint;
  final int maxLines;
final void Function(String?)? onSaved;
final void Function(String)? onChanged;
final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          onSaved: onSaved,
          onChanged: onChanged,
          validator:validator ,
          maxLines: maxLines,
          cursorColor: Colors.amber,
          decoration: InputDecoration(
            hintText: hint,
            focusColor: Colors.amber,
            border: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.amber,
            )),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.amber,
            )),
          ),
        ),
      ],
    );
  }
}
