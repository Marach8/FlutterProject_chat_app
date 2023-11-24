import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/constants/sizes_of_widgets.dart';
import 'package:chat_app/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomListTileWithoutSubtitle extends StatelessWidget{
  final String title; final void Function()? onTap; final double? iconSize;
  final IconData? leadingIcon, trailingIcon; final Color? trailingIconColor;
  final double topBorderRadius, bottomBorderRadius;
  final EdgeInsetsGeometry? padding;
  const CustomListTileWithoutSubtitle({
    this.leadingIcon, this.trailingIcon, required this.title, this.iconSize, this.trailingIconColor,
    required this.topBorderRadius, required this.bottomBorderRadius, this.onTap, this.padding, super.key
  });

  @override
  Widget build(BuildContext context){
    return Material(
      //animationDuration: const Duration(milliseconds: 10),
      color: customBackgroundColor,
      child: ListTile(
        title: CustomTextWidget(color: customWhiteColor, size: sizeOfTitleOne, fontWeight: fontWeightOne, text: title),
        leading: FaIcon(leadingIcon, color: customGreenColor, size: iconSize,), 
        trailing: Icon(trailingIcon, size: sizeOfTrailingIconOne, color: trailingIconColor),
        tileColor: customForegroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(topBorderRadius), bottom: Radius.circular(bottomBorderRadius))
        ),
        contentPadding: padding,//const EdgeInsets.fromLTRB(35, 0, 30, 0),
        enabled: true, enableFeedback: true,
        onTap: onTap, splashColor: customWhite70Color,
      ),
    );
  }
}




class CustomListTileWithSubtitle extends StatelessWidget{
  final String title, subtitle; final VoidCallback? onTap;
  final Widget? leading, trailing;
  final double topBorderRadius, bottomBorderRadius, sizeOfSubtitle;
  const CustomListTileWithSubtitle({
    this.leading, required this.title, required this.subtitle, required this.topBorderRadius,
    required this.bottomBorderRadius, this.trailing, this.onTap, required this.sizeOfSubtitle, super.key
  });

  @override
  Widget build(BuildContext context){
    return Material(
      color: customBackgroundColor,
      animationDuration: const Duration(milliseconds: 100),
      child: ListTile(
        title: CustomTextWidget(color: customWhiteColor, size: sizeOfTitleOne, fontWeight: fontWeightOne, text: title),
        subtitle: CustomTextWidget(color: customWhite54Color, size: sizeOfSubtitle, fontWeight: fontWeightOne, text: subtitle),
        trailing: trailing, tileColor: customForegroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(topBorderRadius), bottom: Radius.circular(bottomBorderRadius))
        ),
        contentPadding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
        enabled: true, enableFeedback: true, //dense: true,
        onTap: onTap
      ),
    );
  }
}




class CustomListTileWithSwitch extends StatefulWidget{
  final String title; final String subtitle; 
  final double topBorderRadius, bottomBorderRadius, sizeOfSubtitle;
  const CustomListTileWithSwitch({
    required this.title, required this.subtitle, required this.topBorderRadius, 
    required this.bottomBorderRadius, required this.sizeOfSubtitle, super.key
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
      color: customBackgroundColor,
      child: SwitchListTile(
        title: CustomTextWidget(color: customWhiteColor, size: sizeOfTitleOne, fontWeight: fontWeightOne, text: widget.title),
        subtitle: CustomTextWidget(
          color: customWhite54Color, size: widget.sizeOfSubtitle, 
          fontWeight: fontWeightOne, text: widget.subtitle
        ),
        tileColor: customForegroundColor, dense: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(widget.topBorderRadius), 
            bottom: Radius.circular(widget.bottomBorderRadius))
        ),
        contentPadding: const EdgeInsets.fromLTRB(35, 0, 10, 0),
        value: _isSwitched, 
        onChanged: (parameter) => setState(() => _isSwitched = parameter),
        activeColor: customGreenColor,
        inactiveThumbColor: Colors.white12, inactiveTrackColor: Colors.black
      ),
    );
  }
}