import 'package:flutter/material.dart';

class TxtField extends StatelessWidget {
  const TxtField(
      {Key? key,
      required this.inputType,
      required this.hintText,
      this.obscureText = false,
      this.textEditingController})
      : super(key: key);
  final TextInputType inputType;
  final String hintText;
  final bool obscureText;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
      child: TextField(
        obscureText: obscureText,
        controller: textEditingController,
        autofocus: false,
        style: TextStyle(fontSize: 16, color: Color(0xFFbdc6cf)),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 16.0, top: 16.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
