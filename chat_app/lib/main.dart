import 'package:chat_app/constants/routes.dart';
import 'package:chat_app/views/contacts_view.dart';
import 'package:chat_app/views/home_view.dart';
import 'package:chat_app/views/settings_about_view.dart';
import 'package:chat_app/views/settings_chatscreen_view.dart';
import 'package:chat_app/views/settings_homescreen_view.dart';
import 'package:chat_app/views/settings_privacysecurity_view.dart';
import 'package:chat_app/views/settings_themes_view.dart';
import 'package:chat_app/views/settings_universal_view.dart';
import 'package:chat_app/views/settings_update_view.dart';
import 'package:chat_app/views/settings_view.dart';
import 'package:chat_app/views/settings_widget_view.dart';
import 'package:flutter/material.dart';

void main() => runApp (const ChatApp());

class ChatApp extends StatelessWidget{
  const ChatApp({super.key});

  @override 
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.deepPurple,
      useMaterial3: true
    ),
    home: const ChatAppHomepage(),
    routes: {
      contactsRoute: (context) => const ContactsView(),
      settingsRoute: (context) => const SettingsView(),
      privacySecuritySettingsRoute: (context) => const PrivacyAndSecurityView(),
      updatesSettingsRoute: (context) => const UpdatesView(),
      aboutSettingsRoute: (context) => const AboutView(),
      themesSettingsRoute: (context) => const ThemesView(),
      universalSettingsRoute: (context) => const UniversalView(),
      homescreenSettingsRoute: (context) => const HomeScreenView(),
      chatscreenSettingsRoute: (context) => const ChatScreenView(),
      widgetsSettingsRoute: (context) => const WidgetsView(),
    }
  );
}
