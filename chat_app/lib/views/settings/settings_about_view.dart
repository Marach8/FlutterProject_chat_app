import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/custom_widgets/container_widget.dart';
import 'package:chat_app/custom_widgets/divider_widget.dart';
import 'package:chat_app/custom_widgets/listtile_widget.dart';
import 'package:chat_app/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
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
          text: 'About'
        ),
        backgroundColor: customBackgroundColor, 
        foregroundColor: customWhite70Color,
      ),

      body: ListView(
        children: [
          const Gap(10),
          CustomContainer(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 15, 0, 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextWidget(
                    size: 16, 
                    fontWeight: FontWeight.w700,
                    text: 'ABOUT',
                    color: customWhiteColor
                  )
                ),
              ),
              CustomListTileWithoutSubtitle(
                title: 'GBWhatsApp Pro v17.55', 
                leadingIcon: FontAwesomeIcons.whatsapp,
                topBorderRadius: 0,
                bottomBorderRadius: 0,
                iconSize: 20,
                onTap: (){}
              ),
              const CustomDivider(indent: 60),
              CustomListTileWithoutSubtitle(
                title: 'By AlexMods.com', 
                leadingIcon: FontAwesomeIcons.personCircleQuestion,
                topBorderRadius: 0, 
                bottomBorderRadius: 0, 
                onTap: (){}
              ),
              const CustomDivider(indent: 60),
              CustomListTileWithoutSubtitle(
                title: 'FAQs', leadingIcon: FontAwesomeIcons.circleQuestion,
                topBorderRadius: 0, bottomBorderRadius: 20, onTap: (){}
              ),
            ]
          ),
          
          const Gap(10),

          CustomContainer(
            children: [
              const Padding(
                padding: EdgeInsets.only(left:30, top: 15, bottom: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: CustomTextWidget(
                    size: 16, fontWeight: FontWeight.w700, text: 'FOLLOW ME TO STAY UPDATED', color: customWhiteColor
                  )
                ),
              ),
              CustomListTileWithoutSubtitle(
                title: 'Twitter', leadingIcon: FontAwesomeIcons.squareTwitter,
                topBorderRadius: 0, bottomBorderRadius: 0, onTap: (){}
              ),
              const CustomDivider(indent: 60),
              CustomListTileWithoutSubtitle(
                title: 'Telegram', leadingIcon: FontAwesomeIcons.telegram,
                topBorderRadius: 0, bottomBorderRadius: 0, onTap: (){}
              ),
              const CustomDivider(indent: 60),
              CustomListTileWithoutSubtitle(
                title: 'Facebook', leadingIcon: FontAwesomeIcons.squareFacebook,
                topBorderRadius: 0, bottomBorderRadius: 0, onTap: (){}
              ),
              const CustomDivider(indent: 60),
              CustomListTileWithoutSubtitle(
                title: 'VKontakte', leadingIcon: FontAwesomeIcons.vk,
                topBorderRadius: 0, bottomBorderRadius: 20, onTap: (){}
              ),
            ],
          )
        ],
      )
    )
  );
}