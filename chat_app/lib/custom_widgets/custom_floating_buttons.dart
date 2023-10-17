import 'package:flutter/material.dart';

Widget customFABs (IconData icon, bool mini) => Builder(
  builder: (context) => FloatingActionButton(
    onPressed: (){}, mini: mini, elevation: 50,
    backgroundColor: const Color.fromARGB(255, 38, 165, 132),
    shape: const CircleBorder(),
    child: Icon(icon, color: Colors.white), 
  )
);