import 'package:chat_app/constants/routes.dart';
import 'package:chat_app/functions/navigate_screen_function.dart';
import 'package:flutter/material.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: const Text('Goto Inbox'),
        onPressed: () => pushNamedNavigation(
          context, 
          chatsInboxRoute
        )
      )
    );
  }
}