import 'package:another_flushbar/flushbar.dart';
import 'package:chat_app/constants/colors.dart';
import 'package:flutter/material.dart';

Future showFlushbar(BuildContext context, String message){
  return Flushbar(
    messageText: IntrinsicWidth(
      child: Center(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: customForegroundColor,),
          padding: const EdgeInsets.all(10),
          child: Text(
            message, style: const TextStyle(color: customWhiteColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ),
    margin: const EdgeInsets.only( bottom: 100),
    duration: const Duration(seconds:2), flushbarPosition: FlushbarPosition.BOTTOM,
    backgroundColor: Colors.transparent, borderRadius: BorderRadius.circular(10),
  ).show(context);
}