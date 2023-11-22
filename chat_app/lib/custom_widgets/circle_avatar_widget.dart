import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget{
  final double radius; final Color color; final Widget child; final ImageProvider? image;
  
  const CustomCircleAvatar({
    required this.radius, required this.color, required this.child, this.image, super.key
  });

  @override 
  Widget build(BuildContext context) => CircleAvatar(
    radius: radius, backgroundColor: color, backgroundImage: image, child: child
  );
}