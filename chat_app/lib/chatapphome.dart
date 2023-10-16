import 'package:flutter/material.dart';

class ChatAppHomepage extends StatefulWidget{
  const ChatAppHomepage({super.key});

  @override 
  State<ChatAppHomepage> createState() => _Homepage();
}

class _Homepage extends State<ChatAppHomepage> {
  
  @override 
  Widget build(BuildContext context) => DefaultTabController(
    length: 5,
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900, foregroundColor: Colors.white60, centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('WhatsApp'), Icon(Icons.wifi), Icon(Icons.sunny),Icon(Icons.search_rounded), 
            Icon(Icons.photo_camera_outlined), Icon(Icons.more_vert_sharp)
          ]
        ),
        bottom: const TabBar(
          isScrollable: true,
          tabs: [
            Icon(Icons.people_rounded), 
            Row(children:[Text('Chats'), CircleAvatar(radius: 10),]),
            Row(children:[Text('Groups'), CircleAvatar(radius: 10)]),
            Row(children:[Text('Status'), CircleAvatar(radius: 3)]),
            Text('Calls')
          ]
        )
      )
    )
  );
}