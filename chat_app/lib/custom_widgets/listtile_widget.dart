import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CustomListTileWithoutSubtitle extends StatelessWidget{
  final String title; final VoidCallback? onTap;
  final IconData? leadingIcon, trailingIcon;
  const CustomListTileWithoutSubtitle({
    required this.leadingIcon, required this.title, this.trailingIcon, this.onTap, super.key
  });

  @override
  Widget build(BuildContext context){
    return Material(
      color: customBackgroundColor,
      child: ListTile(
        title: CustomTextWidget(color: Colors.white, size: 16, fontWeight: FontWeight.w400, text: title),
        leading: Icon(leadingIcon, color:customGreenColor, size: 25), 
        trailing: Icon(trailingIcon, size: 15, color: Colors.white38),
        tileColor: Colors.blueGrey.shade900, //dense: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.fromLTRB(35, 0, 30, 0),
        enabled: true, enableFeedback: true,
        onTap: onTap
      ),
    );
  }
}


class CustomListTileWithSubtitle extends StatelessWidget{
  final String title, subtitle; final VoidCallback? onTap;
  final IconData? leadingIcon, trailingIcon;
  const CustomListTileWithSubtitle({
    this.leadingIcon, required this.title, required this.subtitle, this.trailingIcon, this.onTap, super.key
  });

  @override
  Widget build(BuildContext context){
    return Material(
      color: customForegroundColor,
      child: ListTile(
        title: CustomTextWidget(color: Colors.white, size: 16, fontWeight: FontWeight.w400, text: title),
        subtitle: CustomTextWidget(color: customWhite54Color, size: 13, fontWeight: FontWeight.w400, text: subtitle),
        leading: Icon(leadingIcon, color:customGreenColor, size: 25), 
        trailing: Icon(trailingIcon, size: 15, color: Colors.white38),
        tileColor: Colors.blueGrey.shade900, //dense: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
        enabled: true, enableFeedback: true,
        onTap: onTap
      ),
    );
  }
}



class CustomListTileWithSwitch extends StatefulWidget{
  final String title; final String subtitle; 
  const CustomListTileWithSwitch({
    required this.title, required this.subtitle, super.key
  });

  @override
  State<CustomListTileWithSwitch> createState() => _CustomListTileWithSwitchState();
}

class _CustomListTileWithSwitchState extends State<CustomListTileWithSwitch> {

  bool _isSwitched = false;
  bool get isSwitched => _isSwitched;

  @override
  Widget build(BuildContext context){
    return Material(
      color: customForegroundColor,
      child: SwitchListTile.adaptive(
        title: CustomTextWidget(color: Colors.white, size: 16, fontWeight: FontWeight.w400, text: widget.title),
        subtitle: CustomTextWidget(color: customWhite54Color, size: 13, fontWeight: FontWeight.w400, text: widget.subtitle),
        tileColor: Colors.blueGrey.shade900, //dense: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
        value: _isSwitched,
        onChanged: (parameter) => setState(() => _isSwitched = parameter),
      ),
    );
  }
}