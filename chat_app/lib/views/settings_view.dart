import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/constants/text_links.dart';
import 'package:chat_app/constants/routes.dart';
import 'package:chat_app/custom_widgets/container_widget.dart';
import 'package:chat_app/custom_widgets/divider_widget.dart';
import 'package:chat_app/custom_widgets/listtile_widget.dart';
import 'package:chat_app/custom_widgets/text_widget.dart';
import 'package:chat_app/functions/navigate_screen_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                  leadingIcon: FontAwesomeIcons.lock, trailingIcon: Icons.arrow_forward_ios_sharp, title: 'Privacy And Security',
                  topBorderRadius: 20, bottomBorderRadius: 20, iconSize: 18,
                  onTap: () => pushNamedNavigation(context, privacySecuritySettingsRoute)
              ),
              ]
            ),
            const Gap(10),
            CustomContainer(
              //color: customForegroundColor,
              children: [
                CustomListTileWithoutSubtitle(
                  leadingIcon: FontAwesomeIcons.faceLaughBeam, trailingIcon: Icons.arrow_forward_ios_sharp, title: 'GBStickers',
                  topBorderRadius: 20, bottomBorderRadius: 0, iconSize: 18,
                  onTap: () async => await urlLauncher(gBStickersUrl)
                ), 
                const CustomDivider(indent: 75),
                CustomListTileWithoutSubtitle(
                  leadingIcon: FontAwesomeIcons.rotate, trailingIcon: Icons.arrow_forward_ios_sharp, title: 'Updates',
                  topBorderRadius: 0, bottomBorderRadius: 0, iconSize: 18,
                  onTap: () => pushNamedNavigation(context, updatesSettingsRoute)
                ),
                const CustomDivider(indent: 75),
                CustomListTileWithoutSubtitle(
                  leadingIcon: FontAwesomeIcons.circleInfo, trailingIcon: Icons.arrow_forward_ios_sharp, title: 'About',
                  topBorderRadius: 0, bottomBorderRadius: 20, iconSize: 18,
                  onTap: () => pushNamedNavigation(context, aboutSettingsRoute)
                ),
              ]
            ),
            const Gap(10),
            CustomContainer(
              //color: customForegroundColor,
              children: [
                CustomListTileWithoutSubtitle(
                  leadingIcon: FontAwesomeIcons.brush, trailingIcon: Icons.arrow_forward_ios_sharp, title: 'Themes',
                  topBorderRadius: 20, bottomBorderRadius: 0, iconSize: 18,
                  onTap: (){}
                ),
                const CustomDivider(indent: 75),
                CustomListTileWithoutSubtitle(
                  leadingIcon: FontAwesomeIcons.sliders, trailingIcon: Icons.arrow_forward_ios_sharp, title: 'Universal',
                  topBorderRadius: 0, bottomBorderRadius: 0, iconSize: 18,
                  onTap: (){},
                ),
                const CustomDivider(indent: 75),
                CustomListTileWithoutSubtitle(
                  leadingIcon: FontAwesomeIcons.houseChimney, trailingIcon: Icons.arrow_forward_ios_sharp, title: 'Home Screen',
                  topBorderRadius: 0, bottomBorderRadius: 0, iconSize: 18,
                  onTap: (){}
                ),
                const CustomDivider(indent: 75),
                CustomListTileWithoutSubtitle(
                  leadingIcon: FontAwesomeIcons.solidMessage, trailingIcon: Icons.arrow_forward_ios_sharp, title: 'Chat Screen',
                  topBorderRadius: 0, bottomBorderRadius: 0, iconSize: 18,
                  onTap: (){}
                ),
                const CustomDivider(indent: 75),
                CustomListTileWithoutSubtitle(
                  leadingIcon: FontAwesomeIcons.cube, trailingIcon: Icons.arrow_forward_ios_sharp, title: 'Widget',
                  topBorderRadius: 0, bottomBorderRadius: 20, iconSize: 18,
                  onTap: (){}
                ),
              ]
            ),
            const Gap(10),
            const CustomContainer(
              //color: customForegroundColor,
              children: [
                CustomListTileWithoutSubtitle(
                  leadingIcon: FontAwesomeIcons.shareNodes, trailingIcon: Icons.arrow_forward_ios_sharp, title: 'Share GBWhatsApp Pro',
                  topBorderRadius: 20, bottomBorderRadius: 20, iconSize: 18,
                ),
              ]
            )
          ]
        )
      ),
    );
  }
}