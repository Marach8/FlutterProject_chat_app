import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emma'),
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: (){},
            ),
            IconButton(
              icon: const Icon(Icons.circle_rounded),
              onPressed: (){},
            )
          ]
        )
      ),
      persistentFooterButtons: [
        Icon(Icons.add),
        TextButton(child: Text('hell'), onPressed: (){},)
      ],
    );
  }
}