import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/custom_widgets/container_widget.dart';
import 'package:chat_app/custom_widgets/divider_widget.dart';
import 'package:chat_app/custom_widgets/listtile_widget.dart';
import 'package:chat_app/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class UpdatesView extends StatefulWidget{
  const UpdatesView({super.key});

  @override
  State<UpdatesView> createState() => _UpdatesState();
}

class _UpdatesState extends State<UpdatesView> {
  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
    value: const SystemUiOverlayStyle(systemNavigationBarColor: customBackgroundColor),
    child: Scaffold(
      backgroundColor: customBackgroundColor,
      appBar: AppBar(
        title: const CustomTextWidget(color: customWhiteColor, size:20, fontWeight: FontWeight.w400, text: 'Updates'),
        backgroundColor: customBackgroundColor, foregroundColor: customWhiteColor
      ),

      body: ListView(
        children: const [
          Gap(10),
          CustomContainer(
            children: [
              CustomListTileWithoutSubtitle(
                leadingIcon: Icons.refresh_rounded, title: 'Check For Updates',
                topBorderRadius: 20, bottomBorderRadius: 0, 
              ),
              CustomDivider(indent: 30),
              CustomListTileWithoutSubtitle(
                leadingIcon: Icons.file_copy, title: 'WhatsApp Changelog',
                topBorderRadius: 0, bottomBorderRadius: 20,
              ),
            ]
          ),
          Gap(12),
          CustomListTileWithoutSubtitle(
            leadingIcon: Icons.arrow_circle_down, title: 'Update From Web',
            topBorderRadius: 20, bottomBorderRadius: 20,
          ),
          Gap(15),
          Center(
            child: CustomTextWidget(color: customWhiteColor, size: 16, fontWeight: FontWeight.w400, text: 'GBWhatsApp Pro v17.55')
          )
        ]
      )
    )
  );
}