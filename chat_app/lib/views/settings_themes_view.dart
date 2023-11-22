import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/custom_widgets/container_widget.dart';
import 'package:chat_app/custom_widgets/divider_widget.dart';
import 'package:chat_app/custom_widgets/listtile_widget.dart';
import 'package:chat_app/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class ThemesView extends StatefulWidget {
  const ThemesView({super.key});

  @override
  State<ThemesView> createState() => _AboutViewState();
}

class _AboutViewState extends State<ThemesView> {
  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
    value: const SystemUiOverlayStyle(systemNavigationBarColor: customBackgroundColor),
    child: Scaffold(
      backgroundColor: customBackgroundColor,
      appBar: AppBar(
        title: const CustomTextWidget(size: 20, fontWeight: FontWeight.w400, text: 'Themes'),
        backgroundColor: customBackgroundColor, foregroundColor: customWhite70Color,
      ),

      body: ListView(
        children: [
          const Gap(15),
          CustomContainer(
            children: [
              CustomListTileWithSubtitle(
                title: 'Download Themes', subtitle: 'Get themes from Themes Online',
                topBorderRadius: 20, bottomBorderRadius: 0,
                onTap: (){}
              ),
              const CustomDivider(indent: 40),
              CustomListTileWithSubtitle(
                title: 'Load Theme', subtitle: 'Load themes stored on sdcard',
                topBorderRadius: 0, bottomBorderRadius: 20, onTap: (){}
              ),
            ]
          ),
          
          const Gap(10),

          CustomContainer(
            children: [
              CustomListTileWithSubtitle(
                title: 'Save Theme', subtitle: 'Save your current settings in (/Download/GBThemes)',
                topBorderRadius: 20, bottomBorderRadius: 0,
                onTap: (){}
              ),
              const CustomDivider(indent: 40),
              CustomListTileWithSubtitle(
                title: 'Restore Theme', subtitle: 'Load Theme stored in (/Download/GBThemes)',
                topBorderRadius: 0, bottomBorderRadius: 20, onTap: (){}
              ),
            ]
          ),

          const Gap(10),

          CustomContainer(
            children: [
              CustomListTileWithSubtitle(
                title: 'Reset Preferences', subtitle: 'Sets back WhatsApp default settings',
                topBorderRadius: 20, bottomBorderRadius: 0,
                onTap: (){}
              ),
              const CustomDivider(indent: 40),
              CustomListTileWithSubtitle(
                title: 'Delete all saved/installed themes', subtitle: 'Clear all themes in (/Download/GBThemes) Even your...',
                topBorderRadius: 0, bottomBorderRadius: 20, onTap: (){}
              ),
            ]
          ),
          const Gap(10),
          const Center(
            child: CustomTextWidget (
              size: 16, fontWeight: FontWeight.w400, text: 'location: /storage/emulated/0/Download/G...',
              color: customWhiteColor
            ),
          ),
        ],
      )
    )
  );
}