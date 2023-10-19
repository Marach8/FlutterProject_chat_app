import 'package:chat_app/constants/routes.dart';
import 'package:chat_app/views/contacts_view.dart';
import 'package:chat_app/views/home_view.dart';
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
      contactsRoute: (context) => const ContactsView()
    }
  );
}
