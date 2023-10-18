import 'package:chat_app/functions/get_contacts.dart';
import 'package:flutter/material.dart';

class CustomFAB extends StatelessWidget{
  final IconData icon;
  final bool mini;
  final VoidCallback function;
  const CustomFAB({required this.icon, required this.mini, required this.function, super.key});

  @override
  Widget build(BuildContext context) => FloatingActionButton(
    onPressed: function, mini: mini, elevation: 50,
    backgroundColor: const Color.fromARGB(255, 38, 165, 132),
    shape: const CircleBorder(),
    child: Icon(icon, color: Colors.white), 
  );
}




class UIFloatingActionButtons extends StatefulWidget {
  final int index;
  const UIFloatingActionButtons({required this.index, super.key});

  @override
  State<UIFloatingActionButtons> createState() => _UIFloatingActionButtonsState();
}

class _UIFloatingActionButtonsState extends State<UIFloatingActionButtons> {
  bool _showOtherFABs = false;

  @override
  Widget build(BuildContext context) => Builder(
    builder: (context) {
    if (widget.index == 0) {return const SizedBox.shrink();}
    else if (widget.index == 1 || widget.index == 2){
      return Stack(
        children: [          
          Positioned(
            right: 0, bottom: 234, child: _showOtherFABs? CustomFAB(icon: Icons.message_rounded, mini: false, 
              function: (){getContacts();}
            ): const SizedBox.shrink(),
          ),
          Positioned(
            right: 0, bottom: 155, child: _showOtherFABs? CustomFAB(icon: Icons.punch_clock_outlined, mini: false, function: (){})
            : const SizedBox.shrink(),
          ),
          Positioned(
            right: 0, bottom: 78, child: _showOtherFABs? CustomFAB(icon: Icons.flag_rounded, mini: false, function: (){})
            : const SizedBox.shrink(),
          ),
          Positioned(
            right: 0, bottom: 0,
            child: CustomFAB(
              mini: false, icon: !_showOtherFABs? Icons.add: Icons.close, 
              function: (){
                setState(() => _showOtherFABs = !_showOtherFABs);
              }
            ),
          ),
        ]
      );
    }
    else if(widget.index == 3) {
      return Stack(
        children: [
          Positioned(right: 0, bottom: 128, child: CustomFAB(icon: Icons.cut_rounded, mini: false, function: (){})),
          Positioned(right: 5, bottom: 67, child: CustomFAB(icon: Icons.edit_rounded, mini: true, function: (){})),
          Positioned(right: 0, bottom: 0, child: CustomFAB(icon: Icons.photo_camera_rounded, mini: false, function: (){}),
          ),
        ]
      );
    } else {
        return Stack(
          children: [
            Positioned(right: 0, bottom: 80, child: CustomFAB(icon: Icons.delete_sweep_rounded, mini: false, function: (){})),
            Positioned(right: 0, bottom: 0, child: CustomFAB(icon: Icons.call_rounded, mini: false, function: (){})),
          ]
        );
      }
    }
  );
}



// class ChatsAndGroupsExtraFAB extends StatelessWidget {
//   const ChatsAndGroupsExtraFAB({super.key});

//   @override
//   Widget build(BuildContext context) => Stack(
//     children: [
//       Positioned(right: 0, bottom: 200, child: CustomFAB(icon: Icons.message_rounded, mini: false, function: (){})),
//       Positioned(right: 5, bottom: 150, child: CustomFAB(icon: Icons.punch_clock_outlined, mini: true, function: (){})),
//       Positioned(right: 0, bottom: 100, child: CustomFAB(icon: Icons.flag_rounded, mini: false, function: (){})),
//     ]
//   );
// }
