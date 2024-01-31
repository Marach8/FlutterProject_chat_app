import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/custom_widgets/floating_button_widget.dart';
import 'package:chat_app/custom_widgets/navigation_destinations.dart';
import 'package:chat_app/views/chats/chat_inbox.dart';
import 'package:chat_app/views/chats/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatAppHomepage extends StatefulWidget{
  const ChatAppHomepage({super.key});

  @override 
  State<ChatAppHomepage> createState() => _Homepage();
}

class _Homepage extends State<ChatAppHomepage>{
  late PageController pageController;
  int index = 0;

  @override 
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: index,
    );
  }

  @override 
  void dispose(){
    super.dispose();
    pageController.dispose();
  }

  
  @override 
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
    value: SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.blueGrey.shade900,
    ),
    child: Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white60,
        backgroundColor: Colors.blueGrey.shade900,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('WhatsApp'), 
            index == 1 || index == 2 ?
              const Icon(Icons.wifi, size: 25) : 
              const SizedBox(width: 25), 
            index == 1 || index == 2 ? 
              const Icon(Icons.sunny, size: 25):
              const SizedBox(width: 25),
            const Icon(Icons.search_rounded), 
            const Icon(Icons.photo_camera_outlined), 
            const Icon(Icons.more_vert_sharp)
          ]
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: customForegroundColor,
        indicatorColor: Colors.blueGrey.shade800,
        onDestinationSelected: (pageIndex)
        => pageController.animateToPage(
            pageIndex, 
            duration: const Duration(milliseconds: 1), 
            curve: Curves.ease
          ),
        overlayColor: MaterialStatePropertyAll(
          Colors.blueGrey.shade800,
        ),
        selectedIndex: index,
        destinations: navWidgets
      ),
      body: PageView(
        onPageChanged: (currentPage) 
          => setState(() => index = currentPage),
        controller: pageController,
        children: [
          const ChatsView(),
          Container(color: Colors.blue),
          Container(color: Colors.green),
          Container(color: Colors.yellow),
          Container(color: Colors.red)
        ],
      ),
      floatingActionButton: UIFloatingActionButtons(index: index) 
    )
  );
}
