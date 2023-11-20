import 'package:chat_app/custom_widgets/listTile_widget.dart';
import 'package:chat_app/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';


class SettingsView extends StatelessWidget{
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context){
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Color.fromARGB(255, 15, 25, 25),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 15, 25, 25),
        appBar: AppBar(
          title: const CustomTextWidget(color: Colors.white70, size: 20, fontWeight: FontWeight.w400, text: 'Settings'),
          backgroundColor: const Color.fromARGB(255, 15, 25, 26), foregroundColor: Colors.white70,
        ),
        body: ListView(
          children: [
            const Gap(10),
            CustomContainer(
              color: Colors.blueGrey.shade900,
              children: const [
                CustomListTile(
                  leadingIcon: Icons.lock_sharp, title: 'Privacy And Security', trailingIcon: Icons.arrow_forward_ios_sharp,
              ),
              ]
            ),
            const Gap(10),
            CustomContainer(
              color: Colors.blueGrey.shade900,
              children: const [
                CustomListTile(leadingIcon: Icons.photo, title: 'GBStickers', trailingIcon: Icons.arrow_forward_ios_sharp,),
                CustomDivider(),
                CustomListTile(leadingIcon: Icons.update_sharp, title: 'Updates', trailingIcon: Icons.arrow_forward_ios_sharp,),
                CustomDivider(),
                CustomListTile(leadingIcon: Icons.info_sharp, title: 'About', trailingIcon: Icons.arrow_forward_ios_sharp,),
              ]
            ),
            const Gap(10),
            CustomContainer(
              color: Colors.blueGrey.shade900,
              children: const [
                CustomListTile(leadingIcon: Icons.brush_outlined, title: 'Themes', trailingIcon: Icons.arrow_forward_ios_sharp,),
                CustomDivider(),
                CustomListTile(leadingIcon: Icons.tune_sharp, title: 'Universal', trailingIcon: Icons.arrow_forward_ios_sharp,),
                CustomDivider(),
                CustomListTile(leadingIcon: Icons.home_sharp, title: 'Home Screen', trailingIcon: Icons.arrow_forward_ios_sharp,),
                CustomDivider(),
                CustomListTile(leadingIcon: Icons.message_rounded, title: 'Chat Screen', trailingIcon: Icons.arrow_forward_ios_sharp,),
                CustomDivider(),
                CustomListTile(leadingIcon: Icons.gif_box_outlined, title: 'Widget', trailingIcon: Icons.arrow_forward_ios_sharp,),
              ]
            ),
            const Gap(10),
            CustomContainer(
              color: Colors.blueGrey.shade900,
              children: const [
                CustomListTile(leadingIcon: Icons.share_sharp, title: 'Share GBWhatsApp Pro', trailingIcon: Icons.arrow_forward_ios_sharp,),
              ]
            )
          ]
        )
      ),
    );
  }
}