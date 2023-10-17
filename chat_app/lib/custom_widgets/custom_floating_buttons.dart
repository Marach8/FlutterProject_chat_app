import 'package:flutter/material.dart';

class CustomFAB extends StatelessWidget{
  final IconData icon;
  final bool mini;
  const CustomFAB({required this.icon, required this.mini, super.key});

  @override
  Widget build(BuildContext context) => FloatingActionButton(
    onPressed: (){}, mini: mini, elevation: 50,
    backgroundColor: const Color.fromARGB(255, 38, 165, 132),
    shape: const CircleBorder(),
    child: Icon(icon, color: Colors.white), 
  );
}
