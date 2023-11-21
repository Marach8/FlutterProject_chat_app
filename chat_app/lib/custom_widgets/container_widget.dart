import 'package:chat_app/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget{
  final List<Widget> children; //final Color? color;
  const CustomContainer({required this.children, super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: customForegroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(20))
      ),
      child: Column(children: children,)
    );
  }
}