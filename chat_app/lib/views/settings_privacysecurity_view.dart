import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/custom_widgets/container_widget.dart';
import 'package:chat_app/custom_widgets/divider_widget.dart';
import 'package:chat_app/custom_widgets/listtile_widget.dart';
import 'package:chat_app/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class PrivacyAndSecurityView extends StatefulWidget{
  const PrivacyAndSecurityView({super.key});

  @override
  State<PrivacyAndSecurityView> createState() => PASView();
}

class PASView extends State<PrivacyAndSecurityView>{
  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
    value: const SystemUiOverlayStyle(systemNavigationBarColor: customBackgroundColor),
    child: Scaffold(
      backgroundColor: customBackgroundColor,
      appBar: AppBar(
        title: const CustomTextWidget(size: 20, fontWeight: FontWeight.w400, text: 'Privacy And Security'),
        backgroundColor: customBackgroundColor, foregroundColor: customWhite70Color,
      ),

      body: ListView(
        children: const [
          Gap(10),
          CustomContainer(
            children: [
              Gap(15),
              Padding(
                padding: EdgeInsets.only(left:30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextWidget(size: 15, fontWeight: FontWeight.w600, text: 'PRIVACY', color: customWhiteColor)
                ),
              ),
              Gap(20),
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextWidget(size: 13, fontWeight: FontWeight.w600, color: customGreenColor, text: 'Hide Online Status')
                ),
              ),
              Gap(5),
              CustomListTileWithSwitch( 
                title: 'Freeze Last Seen', subtitle: 'Please restart WhatsApp for changes to take effect.',
                topBorderRadius: 0, bottomBorderRadius: 0, sizeOfSubtitle: 13,
              ),
              Gap(25),
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextWidget(size: 13, fontWeight: FontWeight.w600, color: customGreenColor, text: 'Status')
                ),
              ),
              Gap(5),
              CustomListTileWithSubtitle( 
                title: 'Contacts', subtitle: 'Change privacy settings.',
                topBorderRadius: 0, bottomBorderRadius: 0, sizeOfSubtitle: 13,
              ),
              Gap(5),
              CustomDivider(indent: 40),
              Gap(5),
              CustomListTileWithSubtitle( 
                title: 'Groups', subtitle: 'Change privacy settings.',
                topBorderRadius: 0, bottomBorderRadius: 0, sizeOfSubtitle: 13,
              ),
              Gap(5),
              CustomDivider(indent: 40),
              Gap(5),
              CustomListTileWithSubtitle( 
                title: 'Broadcasts', subtitle: 'Change privacy settings.',
                topBorderRadius: 0, bottomBorderRadius: 0, sizeOfSubtitle: 13,
              ),
              Gap(5),
              CustomDivider(indent: 40),
              Gap(5),
              CustomListTileWithSubtitle( 
                title: 'Custom Privacy', subtitle: 'View all',
                topBorderRadius: 0, bottomBorderRadius: 0, sizeOfSubtitle: 13,
              ),
              Gap(20),
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextWidget(size: 13, fontWeight: FontWeight.w600, color: customGreenColor, text: 'Calls')
                ),
              ),
              Gap(5),
              CustomListTileWithSubtitle( 
                title: 'Who can call me?', subtitle: 'Everyone',
                topBorderRadius: 0, bottomBorderRadius: 0, sizeOfSubtitle: 13,
              ),
              Gap(20),
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextWidget(size: 13, fontWeight: FontWeight.w600, color: customGreenColor, text: 'Chats')
                ),
              ),
              Gap(10),
              CustomListTileWithSwitch( 
                title: 'Disable Forwarded', subtitle: 'Allows you to re-send messages without Forwarding tag',
                topBorderRadius: 0, bottomBorderRadius: 0, sizeOfSubtitle: 13,
              ),
              Gap(5),
              CustomDivider(indent: 40),
              Gap(5),
              CustomListTileWithSwitch( 
                title: 'Anti-Delete Messages', subtitle: 'Other people cannot delete messages for you',
                topBorderRadius: 0, bottomBorderRadius: 0, sizeOfSubtitle: 13,
              ),
              Gap(5),
              CustomDivider(indent: 40),
              Gap(5),
              CustomListTileWithSwitch( 
                title: 'Show Blue Ticks after reply', subtitle: 'Contact will only see blue ticks after you reply',
                topBorderRadius: 0, bottomBorderRadius: 0, sizeOfSubtitle: 13,
              ),
              Gap(20),
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextWidget(size: 13, fontWeight: FontWeight.w600, color: customGreenColor, text: 'Status')
                ),
              ),
              Gap(10),
              CustomListTileWithSwitch( 
                title: 'Hide View Status', subtitle: "Don't tell contact that you have viewed their status",
                topBorderRadius: 0, bottomBorderRadius: 0, sizeOfSubtitle: 13,
              ),
              Gap(5),
              CustomDivider(indent: 40),
              Gap(5),
              CustomListTileWithSwitch( 
                title: 'Anti-Delete Status', subtitle: 'Deleted statuses/stories will not be deleted for you.',
                topBorderRadius: 0, bottomBorderRadius: 0, sizeOfSubtitle: 13,
              ),
            ]
          ),

          Gap(10),

          CustomContainer(
            children: [
              Gap(15),
              Padding(
                padding: EdgeInsets.only(left:30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextWidget(size: 15, fontWeight: FontWeight.w600, text: 'SECURITY', color: customWhiteColor)
                ),
              ),
              CustomDivider(indent: 30),
              CustomListTileWithSubtitle(
                title: 'Change Password', subtitle: 'Default Password is: 0000, Change it to yours!',
                topBorderRadius: 0, bottomBorderRadius: 0, sizeOfSubtitle: 13,
              ),
              CustomDivider(indent: 30),
              CustomListTileWithoutSubtitle(
                title: 'Change Pattern',
                topBorderRadius: 0, bottomBorderRadius: 0,
              ),
              CustomDivider(indent: 30),
              CustomListTileWithoutSubtitle(
                title: 'Recovery Question',
                topBorderRadius: 20, bottomBorderRadius: 0,
              ),
              CustomDivider(indent: 30),
              CustomListTileWithoutSubtitle(
                title: 'Change Change Lock/pattern Wallpaper,',
                topBorderRadius: 0, bottomBorderRadius: 0,
              ),
              CustomDivider(indent: 30),
              CustomListTileWithSwitch(
                title: 'Make Pattern Invisible', subtitle: '',
                topBorderRadius: 0, bottomBorderRadius: 0, sizeOfSubtitle: 13,
              ),
              CustomListTileWithSwitch(
                title: 'Disable pattern vibration', subtitle: '',
                topBorderRadius: 0, bottomBorderRadius: 0, sizeOfSubtitle: 13,
              )
            ]
          )
        ]
      )
    )
  );
}