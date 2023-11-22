import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/custom_widgets/divider_widget.dart';
import 'package:chat_app/custom_widgets/listTile_widget.dart';
import 'package:chat_app/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class Updates extends StatefulWidget{
  const Updates({super.key});

  @override
  State<Updates> createState() => _UpdatesState();
}

class _UpdatesState extends State<Updates> {
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
          CustomListTileWithoutSubtitle(leadingIcon: Icons.refresh_rounded, title: 'Check For Updates'),
          CustomDivider(),
          CustomListTileWithoutSubtitle(leadingIcon: Icons.history, title: 'WhatsApp Changelog'),
          Gap(12),
          CustomListTileWithoutSubtitle(leadingIcon: Icons.arrow_circle_down, title: 'Update From Web'),
          Gap(15),
          Center(
            child: CustomTextWidget(color: customWhiteColor, size: 16, fontWeight: FontWeight.w400, text: 'GBWhatsApp Pro v17.55')
          )
        ]
      )
    )
  );
}