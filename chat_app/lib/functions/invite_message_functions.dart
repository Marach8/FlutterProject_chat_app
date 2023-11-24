import 'dart:typed_data';
import 'package:another_flushbar/flushbar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/constants/sizes_of_widgets.dart';
import 'package:chat_app/constants/text_links.dart';
import 'package:chat_app/custom_widgets/text_widget.dart';
import 'package:clipboard/clipboard.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


 Future<List<ApplicationWithIcon>> listApps() async{
  List<ApplicationWithIcon> launchableApp = [];
  List<Application> app = await DeviceApps.getInstalledApplications(
    includeSystemApps: true, includeAppIcons: true, onlyAppsWithLaunchIntent: true
  );
  for (var item in app){
    if(item.packageName.contains('messenger') || (item.packageName.contains('messaging')) 
    || (item.packageName.contains('instagram'))){
      if (item is ApplicationWithIcon){
        launchableApp.add(item); 
      }
    }
  }
  return launchableApp;
}


Future displayIcons(BuildContext context, List<ApplicationWithIcon> applications) {
  return showModalBottomSheet(
    context: context, 
    builder: (context) => Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 52, 51, 51),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
      ),
      height: 230, width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0,15,20,0),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const CustomTextWidget(color: Colors.white60, size: 17, fontWeight: FontWeight.w500, text: 'x')
              ),
            ),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 250, height: 40,
                child: AutoSizeText(
                  inviteText,
                  overflow: TextOverflow.ellipsis, maxLines: 2, minFontSize: 15,
                  style: TextStyle(
                    fontWeight: fontWeightOne, color: customWhiteColor
                  ),
                ),
              ), 
              const Gap(10),
              GestureDetector(
                onTap:() async{
                  FlutterClipboard.copy(inviteText);
                  Navigator.pop(context);
                  Flushbar(
                    messageText: const Text(
                      'Copied!', style: TextStyle(color: customWhiteColor),
                      textAlign: TextAlign.center,
                    ),
                    margin: const EdgeInsets.fromLTRB(135, 100, 135, 100),
                    duration: const Duration(seconds: 1),
                    animationDuration: const Duration(seconds:1),
                    flushbarPosition: FlushbarPosition.BOTTOM,
                    backgroundColor: customForegroundColor,
                    borderRadius: BorderRadius.circular(10),              
                  ).show(context);
                },
                child: Container(
                  height: 25, width: 55, 
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Colors.white
                  ),
                  child: const Center(
                    child: CustomTextWidget(
                      color: Colors.blue, size: 12, fontWeight: FontWeight.w600, text: 'COPY'
                    ),
                  ),
                )
              )
            ]
          ),
          const Gap(50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: applications.map((app) {
              final Uint8List byteData = app.icon;
              return Column(
                children: [
                  Image.memory(byteData, height: 50, width: 50),
                  const Gap(5),
                  CustomTextWidget(color: Colors.white, size: 11, fontWeight: FontWeight.w400, text: app.appName)
                ]
              );
            }).toList()
          ),
        ]
      )
    )
  );
}