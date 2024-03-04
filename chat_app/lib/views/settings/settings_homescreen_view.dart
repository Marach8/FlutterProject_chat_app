import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/constants/sizes_of_widgets.dart';
import 'package:chat_app/custom_widgets/container_widget.dart';
import 'package:chat_app/custom_widgets/divider_widget.dart';
import 'package:chat_app/custom_widgets/listtile_widget.dart';
import 'package:chat_app/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
    value: const SystemUiOverlayStyle(
      systemNavigationBarColor: customBackgroundColor
    ),
    child: Scaffold(
      backgroundColor: customBackgroundColor,
      appBar: AppBar(
        title: const CustomTextWidget(
          size: 20, 
          fontWeight: FontWeight.w400,
           text: 'Home Screen'
          ),
        backgroundColor: customBackgroundColor,
        foregroundColor: customWhite70Color,
      ),

      body: ListView(
        children: [
          const Gap(15),
          CustomContainer(
            children: [
              CustomListTileWithoutSubtitle(
                title: 'Header',
                leadingIcon: FontAwesomeIcons.heading,
                trailingIcon: Icons.arrow_forward_ios_sharp,
                topBorderRadius: 20,
                bottomBorderRadius: 0,
                trailingIconColor: customBlackColor,
                onTap: (){}
              ),
              const CustomDivider(indent: 20),
              CustomListTileWithoutSubtitle(
                title: 'Rows',
                leadingIcon: FontAwesomeIcons.bars,
                topBorderRadius: 0,
                bottomBorderRadius: 0,
                trailingIcon: Icons.arrow_forward_ios_sharp,
                trailingIconColor: customBlackColor,
                onTap: (){}
              ),
              const CustomDivider(indent: 20),
              CustomListTileWithoutSubtitle(
                title: 'Floating Action Button', 
                leadingIcon: FontAwesomeIcons.circlePlus,
                topBorderRadius: 0, 
                bottomBorderRadius: 0, 
                trailingIcon: Icons.arrow_forward_ios_sharp,
                trailingIconColor: customBlackColor,
                onTap: (){}
              ),
              const CustomDivider(indent: 20),
              CustomListTileWithoutSubtitle(
                title: 'Status',
                leadingIcon: FontAwesomeIcons.solidCircleUser,
                topBorderRadius: 0,
                bottomBorderRadius: 20,
                trailingIcon: Icons.arrow_forward_ios_sharp,
                trailingIconColor: customBlackColor,
                onTap: (){}
              ),
            ]
          ),

          const Gap(10),

          const CustomContainer(
            children: [
              Gap(15),
              Padding(
                padding: EdgeInsets.only(left:35),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextWidget(
                    size: 15,
                    fontWeight: FontWeight.w800,
                    text: 'MODS',
                    color: customWhite30Color
                  )
                ),
              ),
              Gap(10),
              CustomListTileWithSwitch( 
                title: 'Confirm before sending a Status',
                subtitle: '',
                topBorderRadius: 0,
                bottomBorderRadius: 0,
                sizeOfSubtitle: sizeOfSubtitleOne,
              ),
              CustomListTileWithSwitch( 
                title: 'Viewed Story Toast',
                subtitle: 'Know immediately when anyone views your status by Toast message.',
                topBorderRadius: 0,
                bottomBorderRadius: 0,
                sizeOfSubtitle: sizeOfSubtitleOne,
              ),
              Gap(5),
              CustomListTileWithSwitch( 
                title: 'Hide Chats Divider',
                subtitle: 'Removes grey line between chats in Main Screen',
                topBorderRadius: 0,
                bottomBorderRadius: 0,
                sizeOfSubtitle: sizeOfSubtitleOne,
              ),
              Gap(5),
              CustomListTileWithSwitch( 
                title: 'Disable Contact Online Toast',
                subtitle: 'Its Enabled by default! Turn on if you dont want Online Toast',
                topBorderRadius: 0,
                bottomBorderRadius: 0,
                sizeOfSubtitle: sizeOfSubtitleOne,
              ),
              Gap(5),
              CustomListTileWithSubtitle( 
                title: 'Ringtone Contact Toast',
                subtitle: 'Ringtone to play when contact goes online',
                topBorderRadius: 0,
                bottomBorderRadius: 0,
                sizeOfSubtitle: sizeOfSubtitleOne,
              ),
              CustomListTileWithSubtitle( 
                title: 'Contact Online Toast Location',
                subtitle: 'Top',
                topBorderRadius: 0,
                bottomBorderRadius: 0,
                sizeOfSubtitle: sizeOfSubtitleOne,
              ),
              Padding(
                padding: EdgeInsets.only(left: 35, top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextWidget(
                    size: 14,
                    fontWeight: fontWeightTwo,
                    color: customGreenColor,
                    text: 'Forward Settings'
                  )
                ),
              ),
              Gap(5),
              CustomListTileWithSwitch( 
                title: 'Frequently contacted',
                subtitle: 'Hide Frequently contacted from Forward section',
                topBorderRadius: 0,
                bottomBorderRadius: 0,
                sizeOfSubtitle: sizeOfSubtitleOne,
              ),
              Gap(5),
              CustomListTileWithSwitch( 
                title: 'Other contacts',
                subtitle: 'Hide Other contacts from Forward section',
                topBorderRadius: 0,
                bottomBorderRadius: 0,
                sizeOfSubtitle: sizeOfSubtitleOne,
              ),
              Gap(5),
              CustomListTileWithSwitch( 
                title: 'Recent chats',
                subtitle: 'Hide Recent chats from Forward section',
                topBorderRadius: 0,
                bottomBorderRadius: 20,
                sizeOfSubtitle: sizeOfSubtitleOne,
              ),
            ]
          ),
        ],
      )
    )
  );
}