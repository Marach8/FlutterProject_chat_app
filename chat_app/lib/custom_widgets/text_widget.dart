import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget{
  final Color? color; final String text; final TextOverflow? overflow;
  final double size; final FontWeight fontWeight;

  const CustomTextWidget({
    this.color, required this.size, required this.fontWeight, required this.text,
    this.overflow, super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return Text(
      text, 
      style: GoogleFonts.getFont(
        'Varta',
        fontSize: size, fontWeight: fontWeight, color: color, textStyle: TextStyle(overflow: overflow)
      ),
      //overflow: overflow
    );
  }
}