import 'package:another_flushbar/flushbar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/constants/sizes_of_widgets.dart';
import 'package:chat_app/constants/text_links.dart';
import 'package:chat_app/custom_widgets/container_widget.dart';
import 'package:chat_app/custom_widgets/text_widget.dart';
import 'package:clipboard/clipboard.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';


 Future<List<ApplicationWithIcon>> listApps(bool getInviteMessageApps) async{
  List<ApplicationWithIcon>  retrievedApps = [];
  List<Application> app = await DeviceApps.getInstalledApplications(
    includeSystemApps: true, includeAppIcons: true, onlyAppsWithLaunchIntent: true,
  );
  for (Application item in app){
    if(getInviteMessageApps){
      if(item.packageName.contains('messenger') || (item.packageName.contains('messaging')) 
      || (item.packageName.contains('instagram'))){
        if (item is ApplicationWithIcon){
          retrievedApps.add(item); 
        }
      }
    } 
    else{
      if(item.category == ApplicationCategory.social || item.category == ApplicationCategory.productivity){
        if (item is ApplicationWithIcon){
          //print("${item.category}, ${item.packageName}, ${item.appName}");
          retrievedApps.add(item);
        }
      }
    }
  }
  print(retrievedApps.length);
  return retrievedApps;
}



Future displayIcons(BuildContext context, List<ApplicationWithIcon> applications) {
  return showModalBottomSheet(
    context: context, 
    isScrollControlled: true,
    builder: (context) => AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(systemNavigationBarColor: Color.fromARGB(255, 52, 51, 51),),
      child: SingleChildScrollView(
        child: CustomContainer(
          color: const Color.fromARGB(255, 52, 51, 51),
          customContainerBorder: const BorderRadius.vertical(top:Radius.circular(20)),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0,15,20,0),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const FaIcon(FontAwesomeIcons.xmark, size: 18),
                ),
              ),
            ),
            const Gap(10),
            AppList(apps: applications)
          ]
        ),
      ),
    )
  );
}



class AppList extends StatelessWidget{
  final List<ApplicationWithIcon> apps;
  const AppList({required this. apps, super.key});
  @override
  Widget build(BuildContext context){
    return Container(
      height: 500, width: MediaQuery.of(context).size.width*0.8,
      child: GridView.builder(
        //scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 4),
        itemCount: apps.length,
        itemBuilder: (context, gridIndex){
          final ApplicationWithIcon app = apps[gridIndex];
          final Uint8List bytes = app.icon;
          return Column(
            children: [
              Image.memory(bytes, height: 50, width: 50),
              const Gap(5),
              CustomTextWidget(color: Colors.white, size: 11, fontWeight: FontWeight.w400, text: app.appName)
            ]
          );
        }
      
    ),
          );
  }
}




            // Padding(
            //   padding: const EdgeInsets.fromLTRB(0,15,20,0),
            //   child: Align(
            //     alignment: Alignment.topRight,
            //     child: GestureDetector(
            //       onTap: () => Navigator.pop(context),
            //       child: const FaIcon(FontAwesomeIcons.xmark, size: 18),
            //     ),
            //   ),
            // ),
            // const Gap(10),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const SizedBox(
            //       width: 250, height: 40,
            //       child: AutoSizeText(
            //         inviteText,
            //         overflow: TextOverflow.ellipsis, maxLines: 2, minFontSize: 15,
            //         style: TextStyle(
            //           fontWeight: fontWeightOne, color: customWhiteColor
            //         ),
            //       ),
            //     ), 
            //     const Gap(10),
            //     GestureDetector(
            //       onTap:() async{
            //         FlutterClipboard.copy(inviteText); Navigator.pop(context);
            //         Flushbar(
            //           messageText: const SizedBox(
            //             height: 17, width: 45,
            //             child: Text(
            //               'Copied!', style: TextStyle(color: customWhiteColor),
            //               textAlign: TextAlign.center,
            //             ),
            //           ),
            //           margin: const EdgeInsets.only(left: 135, right: 135, bottom: 100),
            //           duration: const Duration(seconds:2), flushbarPosition: FlushbarPosition.BOTTOM,
            //           backgroundColor: customForegroundColor, borderRadius: BorderRadius.circular(10),
            //         ).show(context);
            //       },
            //       child: Container(
            //         height: 25, width: 55, 
            //         decoration: const BoxDecoration(
            //           borderRadius: BorderRadius.all(Radius.circular(25)),
            //           color: customWhiteColor
            //         ),
            //         child: const Center(
            //           child: CustomTextWidget(
            //             color: Colors.blue, size: 12, fontWeight: FontWeight.w600, text: 'COPY'
            //           ),
            //         ),
            //       )
            //     )
            //   ]
            // ),
            // const Gap(50),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: applications.map((app) {
            //     final Uint8List byteData = app.icon;
            //     return Column(
            //       children: [
            //         Image.memory(byteData, height: 50, width: 50),
            //         const Gap(5),
            //         CustomTextWidget(color: Colors.white, size: 11, fontWeight: FontWeight.w400, text: app.appName)
            //       ]
            //     );
            //   }).toList()
            // ),
            // const Gap(40)