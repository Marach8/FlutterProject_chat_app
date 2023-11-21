import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget{
  final double? indent;
  const CustomDivider({this.indent, super.key});

  @override
  Widget build(BuildContext context){
    return Divider(color: Colors.white10, indent: indent, endIndent: 30, height:1,);
  }
}