import 'package:chat_app/custom_widgets/custom_floating_buttons.dart';
import 'package:flutter/material.dart';

class UIFloatingActionButtons extends StatelessWidget {
  final int index;
  const UIFloatingActionButtons({required this.index, super.key});

  @override
  Widget build(BuildContext context) => Builder(
    builder: (context) {
    if (index == 0) {return const SizedBox.shrink();}
    else if (index == 1 || index == 2){return const CustomFAB(icon:Icons.add, mini: false);}
    else if(index == 3) {
      return const Stack(
        children: [
          Positioned(right: 0, bottom: 128, child: CustomFAB(icon: Icons.cut_rounded, mini: false)),
          Positioned(right: 5, bottom: 67, child: CustomFAB(icon: Icons.edit_rounded, mini: true)),
          Positioned(right: 0, bottom: 0, child: CustomFAB(icon: Icons.photo_camera_rounded, mini: false),
          ),
        ]
      );
    } else {
      return const Stack(
        children: [
          Positioned(right: 0, bottom: 80, child: CustomFAB(icon: Icons.delete_sweep_rounded, mini: false)),
          Positioned(right: 0, bottom: 0, child: CustomFAB(icon: Icons.call_rounded, mini: false)),
        ]
      );
    }
  }
  );
}
