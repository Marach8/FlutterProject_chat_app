import 'package:chat_app/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget{
  final String title;
  final IconData? leadingIcon, trailingIcon;
  const CustomListTile({required this.leadingIcon, required this.title, this.trailingIcon, super.key});

  @override
  Widget build(BuildContext context){
    return Material(
      color: const Color.fromARGB(255, 15, 25, 25),
      child: ListTile(
        title: CustomTextWidget(color: Colors.white, size: 16, fontWeight: FontWeight.w400, text: title),
        leading: Icon(leadingIcon, color:const Color.fromARGB(255, 38, 165, 132), size: 25), 
        trailing: Icon(trailingIcon, size: 15, color: Colors.white38),
        tileColor: Colors.blueGrey.shade900, //dense: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.fromLTRB(35, 0, 30, 0),
        enabled: true, enableFeedback: true,
        onTap: (){},
      ),
    );
  }
}


class CustomContainer extends StatelessWidget{
  final List<Widget> children; final Color? color;
  const CustomContainer({required this.children, this.color, super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(20))
      ),
      child: Column(children: children,)
    );
  }
}


class CustomDivider extends StatelessWidget{
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context){
    return const Divider(color: Colors.white10, indent: 75, endIndent: 30, height:1,);
  }
}