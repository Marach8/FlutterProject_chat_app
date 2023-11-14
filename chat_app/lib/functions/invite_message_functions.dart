import 'dart:typed_data';
import 'package:chat_app/custom_widgets/text_widget.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


 Future<List<Uint8List>> listApps() async{
  List<Uint8List> launchableApp = [];
  List<Application> app = await DeviceApps.getInstalledApplications(
    includeSystemApps: true, includeAppIcons: true, onlyAppsWithLaunchIntent: true
  );
  for (var item in app){
    if(item.packageName.contains('messenger') || (item.packageName.contains('messaging')) 
    || (item.packageName.contains('instagram'))){
      if (item is ApplicationWithIcon){
        final Uint8List byteData = item.icon;
        launchableApp.add(byteData);
        //print(item);  
      }
    }
  }
  return launchableApp;
}


Future displayIcons(BuildContext context, List<Uint8List> appsByteData) {
  return showModalBottomSheet(
    context: context, 
    builder: (context) => Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 52, 51, 51),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
      ),
      height: 200, width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0,15,15,0),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const CustomTextWidget(color: Colors.white60, size: 15, fontWeight: FontWeight.w500, text: 'x')
              ),
            ),
          ),
          const SizedBox(height:10),
          Row(
            children: [
              CustomTextWidget(
                color: Colors.white60, size: 20, fontWeight: FontWeight.w300, 
                text: """
Let's chat on WhatsApp!
                """
              ), const SizedBox(width: 10),
              SizedBox(
                width: 70, height:30,
                child: ElevatedButton(
                  onPressed:() {},
                  child: CustomTextWidget(color: Colors.blue, size: 10, fontWeight: FontWeight.w300, text: 'COPY')
                ),
              )
            ]
          ),
          Row(
            children: appsByteData.map((app) {
              return Column(
                children: [
                  Image.memory(app, height: 50, width: 50),
                  //Text(app.appName)
                ]
              );
            }).toList()
          ),
        ]
      )
    )
  );
}