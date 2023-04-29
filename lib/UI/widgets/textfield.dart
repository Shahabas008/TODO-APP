import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  Textfield(
      {Key? key,
      required this.controllernname,
      required this.labelname,
      required this.custommaxlines})
      : super(key: key);
  var controllernname = TextEditingController();
  final String labelname;
  final int custommaxlines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if ( value!.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      cursorColor: const Color.fromARGB(255, 255, 255, 255),
      maxLines: custommaxlines,
      controller: controllernname,
      decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
              borderSide:
                  BorderSide(style: BorderStyle.solid, color: Colors.white)),
          labelText: labelname,
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 118, 117, 117),
          )),
    );
  }
}
