import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget{
  final Color? color; final String text;
  final double size; final FontWeight fontWeight;

  const CustomTextWidget({
    this.color, required this.size, required this.fontWeight, required this.text,
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    return Text(
      text, 
      style: TextStyle(
        fontSize: size, fontWeight: fontWeight, color: color,
      )
    );
  }
}