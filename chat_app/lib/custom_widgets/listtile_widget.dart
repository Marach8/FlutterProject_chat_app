import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomListTileWithoutSubtitle extends StatelessWidget{
  final String title; final void Function()? onTap; final double? iconSize;
  final IconData? leadingIcon, trailingIcon; final double topBorderRadius, bottomBorderRadius;
  const CustomListTileWithoutSubtitle({
    this.leadingIcon, this.trailingIcon, required this.title, this.iconSize,
    required this.topBorderRadius, required this.bottomBorderRadius, this.onTap, super.key
  });

  @override
  Widget build(BuildContext context){
    return Material(
      //animationDuration: const Duration(milliseconds: 10),
      color: customBackgroundColor,
      child: ListTile(
        title: CustomTextWidget(color: Colors.white, size: 16, fontWeight: FontWeight.w400, text: title),
        leading: FaIcon(leadingIcon, color:customGreenColor, size: iconSize,), 
        trailing: Icon(trailingIcon, size: 15, color: Colors.white38),
        tileColor: Colors.blueGrey.shade900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(topBorderRadius), bottom: Radius.circular(bottomBorderRadius))
        ),
        contentPadding: const EdgeInsets.fromLTRB(35, 0, 30, 0),
        enabled: true, enableFeedback: true,
        onTap: onTap, splashColor: customWhite70Color,
      ),
    );
  }
}


class CustomListTileWithSubtitle extends StatelessWidget{
  final String title, subtitle; final VoidCallback? onTap;
  final Widget? leading, trailing;
  const CustomListTileWithSubtitle({
    this.leading, required this.title, required this.subtitle, this.trailing, this.onTap, super.key
  });

  @override
  Widget build(BuildContext context){
    return Material(
      color: customForegroundColor,
      animationDuration: const Duration(milliseconds: 100),
      child: ListTile(
        title: CustomTextWidget(color: Colors.white, size: 16, fontWeight: FontWeight.w400, text: title),
        subtitle: CustomTextWidget(color: customWhite54Color, size: 13, fontWeight: FontWeight.w400, text: subtitle),
        trailing: trailing, tileColor: Colors.blueGrey.shade900, 
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
        enabled: true, enableFeedback: true, dense: true,
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
      child: SwitchListTile(
        title: CustomTextWidget(color: customWhiteColor, size: 16, fontWeight: FontWeight.w400, text: widget.title),
        subtitle: CustomTextWidget(color: customWhite54Color, size: 13, fontWeight: FontWeight.w400, text: widget.subtitle),
        tileColor: Colors.blueGrey.shade900, dense: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.fromLTRB(40, 0, 10, 0),
        value: _isSwitched, 
        onChanged: (parameter) => setState(() => _isSwitched = parameter),
        activeColor: customGreenColor,
        inactiveThumbColor: Colors.white12, inactiveTrackColor: Colors.black
      ),
    );
  }
}