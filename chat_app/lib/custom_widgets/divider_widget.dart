import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget{
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context){
    return const Divider(color: Colors.white10, indent: 75, endIndent: 30, height:1,);
  }
}