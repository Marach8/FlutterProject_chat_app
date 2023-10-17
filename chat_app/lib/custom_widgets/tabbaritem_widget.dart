import 'package:flutter/material.dart';

class TabBarItem extends StatelessWidget {
  final String text;
  final double radius;
  const TabBarItem({required this.text, required this. radius, super.key});

  @override
  Widget build(BuildContext context) => Builder(
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
}
