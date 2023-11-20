import 'package:chat_app/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget{
  final String title; final EdgeInsetsGeometry? margin;
  final IconData? leadingIcon, trailingIcon;
  const CustomListTile({required this.leadingIcon, required this.title, this.trailingIcon, this.margin, super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      margin: margin, 
      child: ListTile(
        title: CustomTextWidget(color: Colors.white, size: 16, fontWeight: FontWeight.w400, text: title),
        leading: Icon(leadingIcon, color:const Color.fromARGB(255, 38, 165, 132), size: 20), 
        trailing: Icon(trailingIcon, size: 15, color: Colors.white38),
        tileColor: Colors.blueGrey.shade900,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.fromLTRB(35, 0, 30, 0)        
      ),
    );
  }
}