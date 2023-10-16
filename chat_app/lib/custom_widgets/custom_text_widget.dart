import 'package:flutter/material.dart';

Widget customTextWidget(String text, double? radius) => Builder(
  builder: (context) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      children: [
        Text(
          text, 
          style: const TextStyle(
            fontFamily: 'sans-serrif',
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white54
          ),
        ),
        const SizedBox(width:4),
        CircleAvatar(radius: radius, backgroundColor: Colors.blueGrey.shade600,)
      ],
    ),
  )
);