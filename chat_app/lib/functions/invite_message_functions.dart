import 'package:another_flushbar/flushbar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/constants/sizes_of_widgets.dart';
import 'package:chat_app/constants/text_links.dart';
import 'package:chat_app/custom_widgets/container_widget.dart';
import 'package:chat_app/custom_widgets/flushbar_widget.dart';
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
          retrievedApps.add(item);
        }
      }
    }
  }
  return retrievedApps;
}



Future displayIcons(BuildContext context, List<ApplicationWithIcon> applications, bool getInviteMessageApps) {
  final screenWidth = MediaQuery.of(context).size.width;
  final screenHeight = MediaQuery.of(context).size.height;

  return showModalBottomSheet(
    context: context, 
    isScrollControlled: true,
    builder: (context) => AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(systemNavigationBarColor: Color.fromARGB(255, 52, 51, 51),),
      child: CustomContainer(
        height: getInviteMessageApps? screenHeight*0.35 : screenHeight*0.48, width: screenWidth,
        color: const Color.fromARGB(255, 52, 51, 51),
        customContainerBorder: const BorderRadius.vertical(top:Radius.circular(20)),
        children: getInviteMessageApps? [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 20, 20),
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const FaIcon(FontAwesomeIcons.xmark, color: customWhiteColor, size: 18),
              ),
            ),
          ),
          const InviteMessageRow(),
          const Gap(40),
          InviteMessageAppList(apps: applications),
          const Gap(30),
        ] : [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: CustomTextWidget(size: 18, color: customWhiteColor, fontWeight: fontWeightOne, text: 'Share')
                  )
                )
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const FaIcon(FontAwesomeIcons.xmark, color: customWhite54Color, size: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SharingAppList(apps: applications),
          const Gap(40),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: (){},
                      child: const CustomTextWidget(size: 15, color: customWhite54Color, fontWeight: fontWeightOne, text: 'JUST ONCE')
                    )
                  )
                )
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 60, 0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () {},
                       child: const CustomTextWidget(size: 15, color: customWhite54Color, fontWeight: fontWeightOne, text: 'ALWAYS')
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]
      ),
    )
  );
}



class SharingAppList extends StatelessWidget{
  final List<ApplicationWithIcon> apps;
  const SharingAppList({required this.apps, super.key});

  @override
  Widget build(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 170, width: screenWidth,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: (apps.length/8).ceil(),
        itemBuilder: (context, listIndex){
          final startIndex = listIndex * 8;
          final endIndex = (listIndex + 1) * 8;
          final gridApps = apps.sublist(startIndex, endIndex);
          return SizedBox(
            height: 170, width: screenWidth,
            child: GridView.builder(
              shrinkWrap: true, 
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, crossAxisSpacing: 5
              ),
              itemCount: gridApps.length,
              itemBuilder: (context, gridIndex){
                final app = gridApps[gridIndex];
                final Uint8List bytes = app.icon;
                return Column(
                  children: [
                    Image.memory(bytes, height: 50, width: 50),
                    const Gap(5),
                    CustomTextWidget(
                      color: customWhiteColor, size: 11, fontWeight: fontWeightOne, 
                      text: app.appName, overflow: TextOverflow.ellipsis
                    )
                  ]
                );
              },
            ),
          );
        }
      ),
    );
  }
}



class InviteMessageAppList extends StatelessWidget{
  final List<ApplicationWithIcon> apps;
  const InviteMessageAppList({required this.apps, super.key});

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: apps.map((app) {
        final Uint8List byteData = app.icon;
        return Column(
          children: [
            Image.memory(byteData, height: 50, width: 50),
            const Gap(5),
            CustomTextWidget(color: Colors.white, size: 11, fontWeight: FontWeight.w400, text: app.appName)
          ]
        );
      }).toList()
    );
  }
}


class InviteMessageRow extends StatelessWidget{
  const InviteMessageRow({super.key});

  @override
  Widget build(BuildContext context){
    return Row(
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
          onTap:(){
            FlutterClipboard.copy(inviteText); Navigator.pop(context);
            showFlushbar(context, 'Copied!',);
          },
          child: Container(
            height: 25, width: 55, 
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: customWhiteColor
            ),
            child: const Center(
              child: CustomTextWidget(
                color: Colors.blue, size: 12, fontWeight: FontWeight.w600, text: 'COPY'
              ),
            ),
          )
        ),
      ]
    );
  }
}
