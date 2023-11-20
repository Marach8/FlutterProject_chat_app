import 'package:chat_app/constants/colors.dart';
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
    value: const SystemUiOverlayStyle(
      systemNavigationBarColor: customBackgroundColor
    ),
    child: Scaffold(
      backgroundColor: customBackgroundColor,
      appBar: AppBar(
        title: const CustomTextWidget(size: 20, fontWeight: FontWeight.w400, text: 'Privacy And Security'),
        backgroundColor: customBackgroundColor, foregroundColor: customWhite70Color,
      ),
      body: ListView(
        children: const [
          Gap(5),
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
              CustomTextWidget(size: 13, fontWeight: FontWeight.w600, color: customGreenColor, text: 'Hide Online Status'),
              
            ]
          ),
        ]
      )
    )
  );
}