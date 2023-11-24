import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/custom_widgets/container_widget.dart';
import 'package:chat_app/custom_widgets/divider_widget.dart';
import 'package:chat_app/custom_widgets/listtile_widget.dart';
import 'package:chat_app/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class WidgetsView extends StatefulWidget {
  const WidgetsView({super.key});

  @override
  State<WidgetsView> createState() => _AboutViewState();
}

class _AboutViewState extends State<WidgetsView> {
  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
    value: const SystemUiOverlayStyle(systemNavigationBarColor: customBackgroundColor),
    child: Scaffold(
      backgroundColor: customBackgroundColor,
      appBar: AppBar(
        title: const CustomTextWidget(size: 20, fontWeight: FontWeight.w400, text: 'Widget'),
        backgroundColor: customBackgroundColor, foregroundColor: customWhite70Color,
      ),

      body: ListView(
        children: [
          const Gap(5),
          ListTile(
            title: const Text('GBWhatsApp Pro', style: TextStyle(color: customWhiteColor)),
            subtitle: const Text('My Status', style: TextStyle(color: customWhiteColor)),
            leading: Container(
              padding: const EdgeInsets.fromLTRB(4, 5, 4, 0),
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade600,
              ),
              child: const FaIcon(Icons.person_rounded, size: 50, color: customWhiteColor)
            ),
            trailing: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: const FaIcon(FontAwesomeIcons.gear, color: customWhiteColor)
                ),
                const Text('GBPRO', style: TextStyle(color: customWhiteColor, fontSize: 8), )
              ]
            )
          ),

          const Gap(5),

          CustomContainer(
            children: [
              CustomListTileWithoutSubtitle(
                title: 'Background', trailingIcon: FontAwesomeIcons.radio,
                topBorderRadius: 20, bottomBorderRadius: 0, trailingIconColor: customBlackColor,
                padding: const EdgeInsets.fromLTRB(0, 0,30, 0),
                onTap: (){}
              ),
              const CustomDivider(indent: 20),
              CustomListTileWithoutSubtitle(
                title: 'Contact Name and Color',
                topBorderRadius: 0, bottomBorderRadius: 0, trailingIcon: FontAwesomeIcons.circleDot,
                trailingIconColor: customBlackColor, padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                onTap: (){}
              ),
              const CustomDivider(indent: 20),
              CustomListTileWithoutSubtitle(
                title: 'Contact Status Text Color',
                topBorderRadius: 0, bottomBorderRadius: 20, trailingIcon: FontAwesomeIcons.circleDot,
                trailingIconColor: customBlackColor, padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                onTap: (){}
              ),
            ]
          ),
        ],
      )
    )
  );
}

