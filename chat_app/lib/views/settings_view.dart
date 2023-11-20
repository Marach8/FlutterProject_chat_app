import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/constants/routes.dart';
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
        systemNavigationBarColor: customBackgroundColor
      ),
      child: Scaffold(
        backgroundColor: customBackgroundColor,
        appBar: AppBar(
          title: const CustomTextWidget (size: 20, fontWeight: FontWeight.w400, text: 'Settings'),
          backgroundColor: customBackgroundColor, foregroundColor: customWhite70Color
        ),
        body: ListView(
          children: [
            const Gap(10),
            CustomContainer(
              //color: customForegroundColor,
              children: [
                CustomListTile(
                  leadingIcon: Icons.lock_sharp, title: 'Privacy And Security', trailingIcon: Icons.arrow_forward_ios_sharp,
                  onTap: () => Navigator.of(context).pushNamed(privacySecurityRoute)
              ),
              ]
            ),
            const Gap(10),
            const CustomContainer(
              //color: customForegroundColor,
              children: [
                CustomListTile(leadingIcon: Icons.photo, title: 'GBStickers', trailingIcon: Icons.arrow_forward_ios_sharp,),
                CustomDivider(),
                CustomListTile(leadingIcon: Icons.update_sharp, title: 'Updates', trailingIcon: Icons.arrow_forward_ios_sharp,),
                CustomDivider(),
                CustomListTile(leadingIcon: Icons.info_sharp, title: 'About', trailingIcon: Icons.arrow_forward_ios_sharp,),
              ]
            ),
            const Gap(10),
            const CustomContainer(
              //color: customForegroundColor,
              children: [
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
            const CustomContainer(
              //color: customForegroundColor,
              children: [
                CustomListTile(leadingIcon: Icons.share_sharp, title: 'Share GBWhatsApp Pro', trailingIcon: Icons.arrow_forward_ios_sharp,),
              ]
            )
          ]
        )
      ),
    );
  }
}