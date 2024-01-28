import 'package:chat_app/custom_widgets/floating_button_widget.dart';
import 'package:chat_app/custom_widgets/tabbar_item_widget.dart';
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
    )..addListener(() { 
      index = pageController.page!.toInt();
    });
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
        backgroundColor: Colors.blueGrey.shade900,
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.blueGrey.shade900,
        indicatorColor: Colors.blueGrey.shade600,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        onDestinationSelected: (pageIndex) => setState(
          () => 
              index = pageIndex,
              // pageController.animateToPage(
              //   index, 
              //   duration: const Duration(milliseconds: 100), 
              //   curve: Curves.linear
              // )
            
          ),
        surfaceTintColor: Colors.blueGrey.shade600,
        selectedIndex: index,
        destinations: const [
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.message), 
            selectedIcon: FaIcon(FontAwesomeIcons.solidMessage),
            label: 'Chats'
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.peopleGroup), 
            selectedIcon: FaIcon(FontAwesomeIcons.person),
            label: 'Groups'
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.upRightAndDownLeftFromCenter), 
            selectedIcon: FaIcon(FontAwesomeIcons.backward),
            label: 'Updates'
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.phone), 
            selectedIcon: FaIcon(Icons.phone_android),
            label: 'Calls'
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.peopleGroup), 
            selectedIcon: FaIcon(FontAwesomeIcons.userGroup),
            label: 'Communi...'
          ),
        ],
      ),
      body: PageView(
        onPageChanged: (currentPage) => index = currentPage,
        controller: pageController,
        children: [
          Container(color: Colors.black),
          Container(color: Colors.blue),
          Container(color: Colors.green),
          Container(color: Colors.yellow),
          Container(color: Colors.red)
        ],
      )
      
    )
    // child: DefaultTabController(
    //   length: 5,
    //   child: Scaffold(
    //     backgroundColor: Colors.blueGrey.shade900,
    //     appBar: AppBar(
    //       backgroundColor: Colors.blueGrey.shade900, foregroundColor: Colors.white60, centerTitle: true,
    //       title: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           const Text('WhatsApp'), 
    //           index == 1 || index == 2 ? const Icon(Icons.wifi, size: 25): const SizedBox(width: 25), 
    //           index == 1 || index == 2 ? const Icon(Icons.sunny, size: 25): const SizedBox(width: 25),
    //           const Icon(Icons.search_rounded), const Icon(Icons.photo_camera_outlined), const Icon(Icons.more_vert_sharp)
    //         ]
    //       ),
    
    //       bottom: TabBar(
    //         indicatorColor: const Color.fromARGB(255, 38, 165, 132), indicatorWeight: 5, 
    //         isScrollable: true, tabAlignment: TabAlignment.center, controller: tabController,
    //         tabs: const [
    //           Padding(
    //             padding: EdgeInsets.only(bottom: 10),
    //             child: Icon(Icons.people_rounded, color: Colors.white38)
    //           ),
    //           TabBarItem(text: 'Chats', radius: 9),
    //           TabBarItem(text: 'Groups', radius: 9),
    //           TabBarItem(text: 'Status', radius: 3),            
    //           TabBarItem(text: 'Calls', radius: 0)
    //         ]
    //       ),
    //     ),
    //     body: TabBarView(
    //       controller: tabController,
    //       children: [
    //         Container(color: Colors.black.withBlue(20),),
    //         Container(color: Colors.black87),
    //         Container(color: Colors.black87),
    //         Container(color: Colors.black87),
    //         Container(color: Colors.black87)
    //       ],
    //     ),
    //     floatingActionButton: UIFloatingActionButtons(index: index) 
    //   )
    // ),
  );
}
