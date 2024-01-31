import 'package:chat_app/constants/colors.dart';
import 'package:flutter/material.dart';

class ChatsInboxView extends StatelessWidget {
  const ChatsInboxView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customBackgroundColor,
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.circle_rounded),
              onPressed: (){},
            ),
            const Text('Emma')
          ]
        ),
      ),
      bottomSheet: Container(
        color: customWhiteColor, 
        height: 60,
        child: Row(
          children: [
            TextField(
              
            )
          ],
        ),
      )
    );
  }
}