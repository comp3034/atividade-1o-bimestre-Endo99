import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SigUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF008B8B),
        title: new Center(
            child: Text('Sign Up',
                textAlign: TextAlign.right,
                style: GoogleFonts.roboto(
                  fontSize: 40,
                  color: Colors.white,
                ))),
      ),
      body: Container(
        width: 120,
        height: 120,
      ),
    );
  }
}
