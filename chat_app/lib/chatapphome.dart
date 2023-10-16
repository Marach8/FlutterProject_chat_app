import 'package:chat_app/custom_widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class ChatAppHomepage extends StatefulWidget{
  const ChatAppHomepage({super.key});

  @override 
  State<ChatAppHomepage> createState() => _Homepage();
}

class _Homepage extends State<ChatAppHomepage> {
  // late CustomTextWidget customTextWidget;

  // void initState(){
  //   customTextWidget = CustomTextWidget()
  // }
  
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
        bottom: TabBar(
          indicatorColor: Colors.green, indicatorWeight: 5,
          isScrollable: true,
          tabs: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Icon(Icons.people_rounded, color: Colors.white38)
            ),
            customTextWidget('Chats',9),
            customTextWidget('Groups', 9),
            customTextWidget('Status', 3),            
            customTextWidget('Calls', 0)
          ]
        ),
      ),
      body: TabBarView(
        children: [
          Container(color: Colors.black.withBlue(20),),
          Container(color: Colors.black87),
          Container(color: Colors.black87,),
          Container(color: Colors.black87),
          Container(color: Colors.black87)
        ],
      ),
    )
  );
}