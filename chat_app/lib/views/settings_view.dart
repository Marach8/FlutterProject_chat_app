import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/constants/text_links.dart';
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
      value: const SystemUiOverlayStyle(systemNavigationBarColor: customBackgroundColor),
      child: Scaffold(
        backgroundColor: customBackgroundColor,
        appBar: AppBar(
          title: const CustomTextWidget (size: 20, fontWeight: FontWeight.w400, text: 'Settings'),
          backgroundColor: customBackgroundColor, foregroundColor: customWhiteColor
        ),

        body: ListView(
          children: [
            const Gap(10),
            CustomContainer(
              //color: customForegroundColor,
              children: [
                CustomListTileWithoutSubtitle(
                  leadingIcon: Icons.lock_sharp, trailingIcon: Icons.arrow_forward_ios_sharp, title: 'Privacy And Security',
                  topBorderRadius: 20, bottomBorderRadius: 20,
                  onTap: () => pushNamedNavigation(context, privacySecuritySettingsRoute)
              ),
              ]
            ),
            const Gap(10),
            CustomContainer(
              //color: customForegroundColor,
              children: [
                CustomListTileWithoutSubtitle(
                  leadingIcon: Icons.photo, trailingIcon: Icons.arrow_forward_ios_sharp, title: 'GBStickers',
                  topBorderRadius: 20, bottomBorderRadius: 0,
                  onTap: () async => await urlLauncher(gBStickersUrl)
                ), 
                const CustomDivider(indent: 75),
                CustomListTileWithoutSubtitle(
                  leadingIcon: Icons.refresh_rounded, trailingIcon: Icons.arrow_forward_ios_sharp, title: 'Updates',
                  topBorderRadius: 0, bottomBorderRadius: 0,
                  onTap: () => pushNamedNavigation(context, updatesSettingsRoute)
                ),
                const CustomDivider(indent: 75),
                CustomListTileWithoutSubtitle(
                  leadingIcon: Icons.info_sharp, trailingIcon: Icons.arrow_forward_ios_sharp, title: 'About',
                  topBorderRadius: 0, bottomBorderRadius: 20,
                  onTap: (){}
                ),
              ]
            ),
            const Gap(10),
            CustomContainer(
              //color: customForegroundColor,
              children: [
                CustomListTileWithoutSubtitle(
                  leadingIcon: Icons.brush_outlined, trailingIcon: Icons.arrow_forward_ios_sharp, title: 'Themes',
                  topBorderRadius: 20, bottomBorderRadius: 0,
                  onTap: (){}
                ),
                CustomDivider(indent: 75),
                CustomListTileWithoutSubtitle(
                  leadingIcon: Icons.tune_sharp, trailingIcon: Icons.arrow_forward_ios_sharp, title: 'Universal',
                  topBorderRadius: 0, bottomBorderRadius: 0,
                ),
                CustomDivider(indent: 75),
                CustomListTileWithoutSubtitle(
                  leadingIcon: Icons.home_sharp, trailingIcon: Icons.arrow_forward_ios_sharp, title: 'Home Screen',
                  topBorderRadius: 0, bottomBorderRadius: 0,

                ),
                CustomDivider(indent: 75),
                CustomListTileWithoutSubtitle(
                  leadingIcon: Icons.message_rounded, trailingIcon: Icons.arrow_forward_ios_sharp, title: 'Chat Screen',
                  topBorderRadius: 0, bottomBorderRadius: 0,
                ),
                CustomDivider(indent: 75),
                CustomListTileWithoutSubtitle(
                  leadingIcon: Icons.gif_box_outlined, trailingIcon: Icons.arrow_forward_ios_sharp, title: 'Widget',
                  topBorderRadius: 0, bottomBorderRadius: 20,
                ),
              ]
            ),
            const Gap(10),
            const CustomContainer(
              //color: customForegroundColor,
              children: [
                CustomListTileWithoutSubtitle(
                  leadingIcon: Icons.share_sharp, trailingIcon: Icons.arrow_forward_ios_sharp, title: 'Share GBWhatsApp Pro',
                  topBorderRadius: 20, bottomBorderRadius: 20,
                ),
              ]
            )
          ]
        )
      ),
    );
  }
}