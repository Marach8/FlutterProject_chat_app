import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/constants/font_sizes_and_weights.dart';
import 'package:chat_app/constants/routes.dart';
import 'package:chat_app/views/chats/chat_inbox.dart';
import 'package:chat_app/views/contacts_view.dart';
import 'package:chat_app/views/home_view.dart';
import 'package:chat_app/views/settings/settings_about_view.dart';
import 'package:chat_app/views/settings/settings_chatscreen_view.dart';
import 'package:chat_app/views/settings/settings_homescreen_view.dart';
import 'package:chat_app/views/settings/settings_main_view.dart';
import 'package:chat_app/views/settings/settings_privacysecurity_view.dart';
import 'package:chat_app/views/settings/settings_themes_view.dart';
import 'package:chat_app/views/settings/settings_universal_view.dart';
import 'package:chat_app/views/settings/settings_update_view.dart';
import 'package:chat_app/views/settings/settings_widget_view.dart';
import 'package:flutter/material.dart';

void main() => runApp (const ChatApp());

class ChatApp extends StatelessWidget{
  const ChatApp({super.key});

  @override 
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      navigationBarTheme: const NavigationBarThemeData(
        labelTextStyle: MaterialStatePropertyAll(
          TextStyle(
            color: customWhiteColor,
            overflow: TextOverflow.ellipsis,
            fontWeight: fontWeight5
          )
        )
      ),
      brightness: Brightness.light,
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
      chatsInboxRoute: (context) => const ChatsInboxView(),
    }
  );
}
