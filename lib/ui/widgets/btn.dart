import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Btn extends StatelessWidget {
  const Btn({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        style: TextButton.styleFrom(
          minimumSize: Size(double.infinity, 40),
          primary: Colors.white,
          backgroundColor: Color.fromRGBO(230, 88, 62, 1),
          textStyle: GoogleFonts.poppins()
              .copyWith(fontWeight: FontWeight.w400, letterSpacing: .5),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ));
  }
}
