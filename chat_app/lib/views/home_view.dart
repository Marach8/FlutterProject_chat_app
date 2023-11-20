import 'package:chat_app/custom_widgets/floatingbutton_widget.dart';
import 'package:chat_app/custom_widgets/tabbaritem_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatAppHomepage extends StatefulWidget{
  const ChatAppHomepage({super.key});

  @override 
  State<ChatAppHomepage> createState() => _Homepage();
}

class _Homepage extends State<ChatAppHomepage> with SingleTickerProviderStateMixin{

  late TabController tabController;
  int index = 0;

  @override 
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    tabController.addListener(() => setState(() => index = tabController.index));
  }

  @override 
  void dispose(){
    tabController.dispose();
    super.dispose();
  }

  
  @override 
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.blueGrey.shade900,
    ),
    child: DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade900, foregroundColor: Colors.white60, centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('WhatsApp'), 
              index == 1 || index == 2 ? const Icon(Icons.wifi, size: 25): const SizedBox(width: 25), 
              index == 1 || index == 2 ? const Icon(Icons.sunny, size: 25): const SizedBox(width: 25),
              const Icon(Icons.search_rounded), const Icon(Icons.photo_camera_outlined), const Icon(Icons.more_vert_sharp)
            ]
          ),
    
          bottom: TabBar(
            indicatorColor: const Color.fromARGB(255, 38, 165, 132), indicatorWeight: 5, 
            isScrollable: true, tabAlignment: TabAlignment.center, controller: tabController,
            tabs: const [
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Icon(Icons.people_rounded, color: Colors.white38)
              ),
              TabBarItem(text: 'Chats', radius: 9),
              TabBarItem(text: 'Groups', radius: 9),
              TabBarItem(text: 'Status', radius: 3),            
              TabBarItem(text: 'Calls', radius: 0)
            ]
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Container(color: Colors.black.withBlue(20),),
            Container(color: Colors.black87),
            Container(color: Colors.black87),
            Container(color: Colors.black87),
            Container(color: Colors.black87)
          ],
        ),
        floatingActionButton: UIFloatingActionButtons(index: index) 
      )
    ),
  );
}
