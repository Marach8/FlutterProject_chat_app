import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/custom_widgets/container_widget.dart';
import 'package:chat_app/custom_widgets/divider_widget.dart';
import 'package:chat_app/custom_widgets/listtile_widget.dart';
import 'package:chat_app/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class UniversalView extends StatefulWidget {
  const UniversalView({super.key});

  @override
  State<UniversalView> createState() => _AboutViewState();
}

class _AboutViewState extends State<UniversalView> {
  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
    value: const SystemUiOverlayStyle(systemNavigationBarColor: customBackgroundColor),
    child: Scaffold(
      backgroundColor: customBackgroundColor,
      appBar: AppBar(
        title: const CustomTextWidget(size: 20, fontWeight: FontWeight.w400, text: 'Universal'),
        backgroundColor: customBackgroundColor, foregroundColor: customWhite70Color,
      ),

      body: ListView(
        children: [
          const Gap(15),
          CustomContainer(
            children: [
              CustomListTileWithoutSubtitle(
                title: 'Colors', leadingIcon: FontAwesomeIcons.palette, trailingIcon: Icons.arrow_forward_ios_sharp,
                topBorderRadius: 20, bottomBorderRadius: 0, trailingIconColor: customBlackColor,
                onTap: (){}
              ),
              const CustomDivider(indent: 20),
              CustomListTileWithoutSubtitle(
                title: 'Styles (Look and feel)', leadingIcon: FontAwesomeIcons.wandMagic,
                topBorderRadius: 0, bottomBorderRadius: 0, trailingIcon: Icons.arrow_forward_ios_sharp,
                trailingIconColor: customBlackColor,
                onTap: (){}
              ),
              const CustomDivider(indent: 20),
              CustomListTileWithoutSubtitle(
                title: 'Hide Media from gallery', leadingIcon: Icons.visibility_off_rounded,
                topBorderRadius: 0, bottomBorderRadius: 0, trailingIcon: Icons.arrow_forward_ios_sharp,
                trailingIconColor: customBlackColor,
                onTap: (){}
              ),
              const CustomDivider(indent: 20),
              CustomListTileWithoutSubtitle(
                title: 'Backup and restore', leadingIcon: FontAwesomeIcons.database,
                topBorderRadius: 0, bottomBorderRadius: 0, trailingIcon: Icons.arrow_forward_ios_sharp,
                trailingIconColor: customBlackColor,
                onTap: (){}
              ),
              const CustomDivider(indent: 20),
              CustomListTileWithoutSubtitle(
                title: 'Settings', leadingIcon: FontAwesomeIcons.gear,
                topBorderRadius: 0, bottomBorderRadius: 20, trailingIcon: Icons.arrow_forward_ios_sharp,
                trailingIconColor: customBlackColor,
                onTap: (){}
              )
            ]
          ),
        ],
      )
    )
  );
}