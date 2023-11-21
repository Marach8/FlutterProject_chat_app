import 'package:chat_app/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomToggleSwitch extends StatefulWidget{
  const CustomToggleSwitch({super.key});

  @override
  State<CustomToggleSwitch> createState() => TGSwitch();
}

class TGSwitch extends State<CustomToggleSwitch> {

  bool _isSwitched = false;
  bool get isSwitched => _isSwitched;

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Switch(
        //trackOutlineWidth: const MaterialStatePropertyAll(5),
        value: _isSwitched , activeColor: customGreenColor,
        onChanged: (parameter) => setState(() => _isSwitched = parameter),
      
      ),
    );
  }
}