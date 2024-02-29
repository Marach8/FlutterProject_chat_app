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
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
        color: customWhiteColor, 
        height: 60,
        child: Row(
          children: [
            Expanded(
              //flex: 5,
              child: Container(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const TextField(                  
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.add)
                  ),
                ),
              ),
            ),
            CircleAvatar(
              backgroundColor: customGreenColor,
              radius: 22.5,
              child: Center(
                child: IconButton(
                  icon: const Icon(Icons.mic),
                  onPressed: (){}
                ),
              )
            )
          ],
        ),
      )
    );
  }
}