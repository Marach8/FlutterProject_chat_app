import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/constants/custom_text.dart';
import 'package:chat_app/constants/routes.dart';
import 'package:chat_app/custom_widgets/container_widget.dart';
import 'package:chat_app/custom_widgets/divider_widget.dart';
import 'package:chat_app/custom_widgets/listTile_widget.dart';
import 'package:chat_app/custom_widgets/text_widget.dart';
import 'package:chat_app/functions/navigate_screen.dart';
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
                CustomListTileWithoutSubtitle(
                  leadingIcon: Icons.lock_sharp, title: 'Privacy And Security',
                  onTap: () => pushNamedNavigation(context, privacySecurityRoute)
              ),
              ]
            ),
            const Gap(10),
            CustomContainer(
              //color: customForegroundColor,
              children: [
                CustomListTileWithoutSubtitle(
                  leadingIcon: Icons.photo, title: 'GBStickers',
                  onTap: () async => await urlLauncher(gBStickersUrl)
                ), 
                CustomDivider(indent: 75),
                CustomListTileWithoutSubtitle(leadingIcon: Icons.update_sharp, title: 'Updates',),
                CustomDivider(indent: 75),
                CustomListTileWithoutSubtitle(leadingIcon: Icons.info_sharp, title: 'About',),
              ]
            ),
            const Gap(10),
            const CustomContainer(
              //color: customForegroundColor,
              children: [
                CustomListTileWithoutSubtitle(leadingIcon: Icons.brush_outlined, title: 'Themes',),
                CustomDivider(indent: 75),
                CustomListTileWithoutSubtitle(leadingIcon: Icons.tune_sharp, title: 'Universal',),
                CustomDivider(indent: 75),
                CustomListTileWithoutSubtitle(leadingIcon: Icons.home_sharp, title: 'Home Screen',),
                CustomDivider(indent: 75),
                CustomListTileWithoutSubtitle(leadingIcon: Icons.message_rounded, title: 'Chat Screen',),
                CustomDivider(indent: 75),
                CustomListTileWithoutSubtitle(leadingIcon: Icons.gif_box_outlined, title: 'Widget',),
              ]
            ),
            const Gap(10),
            const CustomContainer(
              //color: customForegroundColor,
              children: [
                CustomListTileWithoutSubtitle(leadingIcon: Icons.share_sharp, title: 'Share GBWhatsApp Pro',),
              ]
            )
          ]
        )
      ),
    );
  }
}