import 'package:chat_app/custom_widgets/custom_floating_buttons.dart';
import 'package:chat_app/custom_widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

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
    tabController = TabController(length: 5, vsync: this);
    tabController.addListener(() => setState(() {index = tabController.index;}));
    super.initState();
  }

  @override 
  void dispose(){
    tabController.dispose();
    super.dispose();
  }

  
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
          indicatorColor: const Color.fromARGB(255, 38, 165, 132), indicatorWeight: 5, isScrollable: true,
          tabAlignment: TabAlignment.center,
          controller: tabController,
          tabs: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Icon(Icons.people_rounded, color: Colors.white38)
            ),
            customTextWidget('Chats', 9),
            customTextWidget('Groups', 9),
            customTextWidget('Status', 3),            
            customTextWidget('Calls', 0)
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
      floatingActionButton: customFloatingButtons(index)
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){},
      //   child:  Icon(Icons.add, color: Colors.white),
      //   backgroundColor: const Color.fromARGB(255, 38, 165, 132),
      //   shape: CircleBorder(),
      // ), 
    )
  );
}

Widget customFloatingButtons(int index) => Builder(
  builder: (context) {
    if (index == 0) {return const SizedBox.shrink();}
    else if (index == 1 || index == 2){return customFABs(Icons.add, false);}
    else if(index == 3) {
      return Stack(
        children: [
          Positioned(right: 0, bottom: 128, child: customFABs(Icons.cut_rounded, false)),
          Positioned(right: 5, bottom: 67, child: customFABs(Icons.edit_rounded, true)),
          Positioned(right: 0, bottom: 0, child: customFABs(Icons.photo_camera_rounded, false),
          ),
        ]
      );
    } else {
      return Stack(
        children: [
          Positioned(right: 0, bottom: 80, child: customFABs(Icons.delete_sweep_rounded, false)),
          Positioned(right: 0, bottom: 0, child: customFABs(Icons.call_rounded, false)),
        ]
      );
    }
  }
);

// Widget customFloatingButtons(int index) {

//   if (index == 1 || index == 2) {
//     return Builder(
//       builder: (context) => 
//     );
//   } else if(index == 3) {
//     return Builder(
//       builder: (context) => Stack(
//         children: [
//           Positioned(
//             right: 0, bottom: 100,
//             child: FloatingActionButton(
//               onPressed: (){},
//               child: Icon(Icons.cut_rounded, color: Colors.white)
//             )
//           ),
//           Positioned(
//             right: 0, bottom: 50,
//             child: FloatingActionButton(
//               onPressed: (){},
//               child: Icon(Icons.edit_rounded, color: Colors.white),
//               mini: true
//             )
//           ),
//           Positioned(
//             right: 0, bottom: 0,
//             child: FloatingActionButton(
//               onPressed: (){},
//               child: const Icon(Icons.photo_camera_outlined, color: Colors.white)
//             )
//           ),
//         ]
//       )
//     );
//   } else if(index == 0) {
//     return const SizedBox.shrink();
//   }
//    else{
//     print(index);
//     return Builder(
//       builder: (context) => Stack(
//         children: [
//           Positioned(
//             right: 0, bottom: 50,
//             child: FloatingActionButton(
//               onPressed: (){},
//               child: Icon(Icons.delete_sweep_rounded, color: Colors.white)
//             )
//           ),
//           Positioned(
//             right: 0, bottom: 0,
//             child: FloatingActionButton(
//               onPressed: (){},
//               child: Icon(Icons.call_rounded, color: Colors.white)
//             )
//           ),
//         ]
//       )
//     );
//   }
// }