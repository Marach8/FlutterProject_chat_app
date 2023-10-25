import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// class SendInviteMessage {

//   void sendInviteMessage() async{
//     String message = 'Hello, Come and chat with me on my new whatsApp';
//     final uri = "sms:?body=${Uri.parse(message)}";

//     if(await canLaunchUrl(uri))
//   }
// }

void listApps() async{
  List<Application> app = await DeviceApps.getInstalledApplications(
    includeSystemApps: true, includeAppIcons: true, onlyAppsWithLaunchIntent: true
  );
  for (var item in app){
    //if(item.packageName.contains('message') || (item.packageName.contains('messaging'))){
      print(item.packageName);
    //}
  }
}