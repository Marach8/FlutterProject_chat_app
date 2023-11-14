import 'package:chat_app/custom_widgets/text_widget.dart';
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

 Future<List<Application>> listApps() async{
  List<Application> launchableApp = [];
  List<Application> app = await DeviceApps.getInstalledApplications(
    includeSystemApps: true, includeAppIcons: true, onlyAppsWithLaunchIntent: true
  );
  for (var item in app){
    if(item.packageName.contains('messenger') || (item.packageName.contains('messaging')) 
    || (item.packageName.contains('instagram'))){
      launchableApp.add(item);
      print(item);
    }
  }
  return launchableApp;
}


Future displayIcons(BuildContext context) {
  return showModalBottomSheet(
    context: context, 
    builder: (context) => Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 30, 29, 29),
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
                child: const CustomTextWidget(color: Colors.white70, size: 15, fontWeight: FontWeight.w500, text: 'x')
              ),
            ),
          ),
          Row(),
          const SizedBox(height: 50),
          Row()
        ]
      )
    )
  );
}