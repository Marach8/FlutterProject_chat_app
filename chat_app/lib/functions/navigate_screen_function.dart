import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

void pushNamedNavigation(
  BuildContext context, 
  String route
) => Navigator.of(context).pushNamed(route);

Future<void> urlLauncher(String url) async{
  if (await canLaunchUrlString(url)){
    await launchUrlString(url);
  } else{
    print('Cannot launch Url');
  }
}