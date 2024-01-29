import 'package:chat_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<NavigationDestination> navWidgets = const [
  NavigationDestination(
    icon: FaIcon(
      Icons.message_outlined,
      color: customWhiteColor, 
      size: 20
    ), 
    selectedIcon: FaIcon(
      Icons.message_rounded,
      color: customWhiteColor, 
      size: 20
    ),
    label: 'Chats'
  ),
  NavigationDestination(
    icon: FaIcon(
      Icons.group_outlined,
      color: customWhiteColor, 
      size: 20
    ), 
    selectedIcon: FaIcon(
      Icons.group,
      color: customWhiteColor, 
      size: 20
    ),
    label: 'Groups'
  ),
  NavigationDestination(
    icon: FaIcon(
      FontAwesomeIcons.upRightAndDownLeftFromCenter,
      color: customWhiteColor, 
      size: 20
    ), 
    selectedIcon: FaIcon(
      FontAwesomeIcons.backward,
      color: customWhiteColor, 
      size: 20
    ),
    label: 'Updates'
  ),
  NavigationDestination(
    icon: FaIcon(
      FontAwesomeIcons.phone,
      color: customWhiteColor, 
      size: 20
    ), 
    selectedIcon: FaIcon(
      Icons.phone_android,
      color: customWhiteColor, 
      size: 20
    ),
    label: 'Calls'
  ),
  NavigationDestination(
    icon: FaIcon(
      FontAwesomeIcons.usersLine,
      color: customWhiteColor, 
      size: 20
    ), 
    selectedIcon: FaIcon(
      FontAwesomeIcons.userGroup,
      color: customWhiteColor, 
      size: 20
    ),
    label: 'Communities'
  ),
];