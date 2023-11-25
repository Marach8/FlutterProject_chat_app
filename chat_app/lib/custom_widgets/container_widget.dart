import 'package:chat_app/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget{
  final List<Widget> children; final Color? color;
  final BorderRadiusGeometry? customContainerBorder;
  const CustomContainer({required this.children, this.color, this.customContainerBorder, super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: color ?? customForegroundColor,
        borderRadius: customContainerBorder ?? const BorderRadius.all(Radius.circular(20))
      ),
      child: Column(children: children,)
    );
  }
}