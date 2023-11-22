import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/custom_widgets/container_widget.dart';
import 'package:chat_app/custom_widgets/divider_widget.dart';
import 'package:chat_app/custom_widgets/listtile_widget.dart';
import 'package:chat_app/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
    value: const SystemUiOverlayStyle(systemNavigationBarColor: customBackgroundColor),
    child: Scaffold(
      backgroundColor: customBackgroundColor,
      appBar: AppBar(
        title: const CustomTextWidget(size: 20, fontWeight: FontWeight.w400, text: 'About'),
        backgroundColor: customBackgroundColor, foregroundColor: customWhite70Color,
      ),

      body: ListView(
        children: [
          const Gap(10),
          CustomContainer(
            children: [
              const Padding(
                padding: EdgeInsets.only(left:30, top: 15, bottom: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextWidget(size: 15, fontWeight: FontWeight.w700, text: 'ABOUT', color: customWhiteColor)
                ),
              ),
              CustomListTileWithoutSubtitle(
                title: 'GBWhatsApp Pro v17.55', leadingIcon: Icons.chat,
                topBorderRadius: 0, bottomBorderRadius: 0, onTap: (){}
              ),
              const CustomDivider(indent: 50),
              CustomListTileWithoutSubtitle(
                title: 'By AlexMods.com', leadingIcon: Icons.computer_rounded,
                topBorderRadius: 0, bottomBorderRadius: 0, onTap: (){}
              ),
              const CustomDivider(indent: 50),
              CustomListTileWithoutSubtitle(
                title: 'FAQs', leadingIcon: Icons.help_rounded,
                topBorderRadius: 0, bottomBorderRadius: 20, onTap: (){}
              ),
            ]
          ),
          
          const Gap(10),

          CustomContainer(
            children: [
              const Padding(
                padding: EdgeInsets.only(left:30, top: 15, bottom: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextWidget(
                    size: 15, fontWeight: FontWeight.w700, text: 'FOLLOW ME TO STAY UPDATED', color: customWhiteColor
                  )
                ),
              ),
              CustomListTileWithoutSubtitle(
                title: 'Twitter', leadingIcon: Icons.chat,
                topBorderRadius: 0, bottomBorderRadius: 0, onTap: (){}
              ),
              const CustomDivider(indent: 50),
              CustomListTileWithoutSubtitle(
                title: 'Telegram', leadingIcon: Icons.computer_rounded,
                topBorderRadius: 0, bottomBorderRadius: 0, onTap: (){}
              ),
              const CustomDivider(indent: 50),
              CustomListTileWithoutSubtitle(
                title: 'Facebook', leadingIcon: Icons.help_rounded,
                topBorderRadius: 0, bottomBorderRadius: 0, onTap: (){}
              ),
              const CustomDivider(indent: 50),
              CustomListTileWithoutSubtitle(
                title: 'VKontakte', leadingIcon: Icons.help_rounded,
                topBorderRadius: 0, bottomBorderRadius: 20, onTap: (){}
              ),
            ],
          )
        ],
      )
    )
  );
}