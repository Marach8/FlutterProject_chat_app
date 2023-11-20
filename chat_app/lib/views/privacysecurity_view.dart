import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      )
    )
  );
}