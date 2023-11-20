import 'package:chat_app/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';


class SettingsView extends StatelessWidget{
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 25, 25),
      appBar: AppBar(
        title: const CustomTextWidget(color: Colors.white70, size: 20, fontWeight: FontWeight.w400, text: 'Settings'),
        backgroundColor: const Color.fromARGB(255, 15, 25, 26), foregroundColor: Colors.white70,
      ),
      body: ListView(
        children: const [
          CustomListTile(
            leadingIcon: Icons.lock_sharp, title: 'Privacy And Security', trailingIcon: Icons.arrow_forward_ios_sharp,
            margin: EdgeInsets.fromLTRB(0, 10, 0, 12)
          ),
          CustomListTile(leadingIcon: Icons.photo, title: 'GBStickers', trailingIcon: Icons.arrow_forward_ios_sharp,),
          CustomListTile(leadingIcon: Icons.update_sharp, title: 'Updates', trailingIcon: Icons.arrow_forward_ios_sharp,),
          CustomListTile(leadingIcon: Icons.info_sharp, title: 'About', trailingIcon: Icons.arrow_forward_ios_sharp,),
          CustomListTile(
            leadingIcon: Icons.brush_outlined, title: 'Themes', trailingIcon: Icons.arrow_forward_ios_sharp,
            margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
          ),
          CustomListTile(leadingIcon: Icons.tune_sharp, title: 'Universal', trailingIcon: Icons.arrow_forward_ios_sharp,),
          CustomListTile(leadingIcon: Icons.home_sharp, title: 'Home Screen', trailingIcon: Icons.arrow_forward_ios_sharp,),
          CustomListTile(leadingIcon: Icons.message_rounded, title: 'Chat Screen', trailingIcon: Icons.arrow_forward_ios_sharp,),
          CustomListTile(leadingIcon: Icons.gif_box_outlined, title: 'Widget', trailingIcon: Icons.arrow_forward_ios_sharp,),
          CustomListTile(leadingIcon: Icons.share_sharp, title: 'Share GBWhatsApp Pro', trailingIcon: Icons.arrow_forward_ios_sharp,
            margin: EdgeInsets.fromLTRB(0, 12, 0, 0)
          ),
        ]
      )
    );
  }
}

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