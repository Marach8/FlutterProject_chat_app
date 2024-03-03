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

class ChatScreenView extends StatelessWidget {
  const ChatScreenView({super.key});

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
          text: 'Chat Screen'
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
                title: 'Action Bar',
                leadingIcon: FontAwesomeIcons.heading,
                trailingIcon: Icons.arrow_forward_ios_sharp,
                topBorderRadius: 20,
                bottomBorderRadius: 0,
                trailingIconColor: customBlackColor,
                onTap: (){}
              ),
              const CustomDivider(indent: 20),
              CustomListTileWithoutSubtitle(
                title: 'Bubble And Ticks',
                leadingIcon: FontAwesomeIcons.solidSquareCheck,
                topBorderRadius: 0,
                bottomBorderRadius: 0,
                trailingIcon: Icons.arrow_forward_ios_sharp,
                trailingIconColor: customBlackColor,
                onTap: (){}
              ),
              const CustomDivider(indent: 20),
              CustomListTileWithoutSubtitle(
                title: 'Conversation Entry Style',
                leadingIcon: FontAwesomeIcons.solidComments,
                topBorderRadius: 0,
                bottomBorderRadius: 0,
                trailingIcon: Icons.arrow_forward_ios_sharp,
                trailingIconColor: customBlackColor,
                onTap: (){}
              ),
              const CustomDivider(indent: 20),
              CustomListTileWithoutSubtitle(
                title: 'More Options',
                leadingIcon: FontAwesomeIcons.gear,
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
                title: 'Group Admin Indicator',
                subtitle: '',
                topBorderRadius: 0,
                bottomBorderRadius: 0, 
                sizeOfSubtitle: sizeOfSubtitleOne,
              ),
              CustomListTileWithSwitch( 
                title: 'Confirm before sending a Sticker',
                subtitle: 'Confirm before sending a sticker',
                topBorderRadius: 0,
                bottomBorderRadius: 0,
                sizeOfSubtitle: sizeOfSubtitleOne,
              ),
              Gap(10),
              CustomListTileWithSwitch( 
                title: 'New Attachment Picker UI',
                subtitle: '',
                topBorderRadius: 0,
                bottomBorderRadius: 0,
                sizeOfSubtitle: sizeOfSubtitleOne,
              ),
              Gap(5),
              CustomListTileWithSwitch( 
                title: 'Hide date and name',
                subtitle: 'Hide the date and name when copying 2 messages or more',
                topBorderRadius: 0,
                bottomBorderRadius: 0,
                sizeOfSubtitle: sizeOfSubtitleOne,
              ),
              Gap(5),
              Padding(
                padding: EdgeInsets.only(left: 35, top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextWidget(
                    size: 14,
                    fontWeight: fontWeightTwo,
                    color: customGreenColor,
                    text: 'Voice Notes/Audio Mods'
                  )
                ),
              ),
              Gap(5),
              CustomListTileWithSwitch( 
                title: 'Enable Proximity Sensor',
                subtitle: 'Enabled by default, disable to turn it off.',
                topBorderRadius: 0,
                bottomBorderRadius: 0,
                sizeOfSubtitle: sizeOfSubtitleOne,
              ),
              Gap(5),
              CustomListTileWithSwitch( 
                title: 'Disable Output Switching',
                subtitle: 'Prevernts speaker/earpiece switching while playing',
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