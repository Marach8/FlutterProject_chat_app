import 'package:chat_app/constants/colors.dart';
import 'package:chat_app/custom_widgets/circle_avatar_widget.dart';
import 'package:chat_app/custom_widgets/text_widget.dart';
import 'package:chat_app/functions/contacts_function.dart';
import 'package:chat_app/functions/invite_message_functions.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactsView extends StatefulWidget {
  const ContactsView({super.key});

  @override
  State<ContactsView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactsView> {
  bool searchContacts = false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Color.fromARGB(255, 0, 22, 26)
      ),
      child: Scaffold(
        backgroundColor: customBlackColor,
        appBar: AppBar(
          backgroundColor: customForegroundColor,
          foregroundColor: customWhite60Color,
          title: Builder(
            builder: (BuildContext context) {
              return Row(
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 1000),
                    child: !searchContacts? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          color: Colors.blueGrey.shade400,
                          size: 20,
                          fontWeight: FontWeight.w400,
                          text: 'Select contact',
                        ),
                        const CustomTextWidget(
                          color: Colors.white,
                          size: 14,
                          fontWeight: FontWeight.w400,
                          text: '954 contacts'
                        )
                      ]
                    ): const TextField(
                      cursorColor: Color.fromARGB(255, 38, 165, 132),
                      decoration: InputDecoration(
                        hintText: 'Type a name or number...',
                      ),
                    ),
                  ),
                ],
              );
            }
          ),
          actions: [
            Builder(
              builder: (innerContext) {
                return IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 20,
                    color: Colors.white
                  ), 
                  onPressed: (){setState(() => searchContacts = true);}
                );
              }
            ),
            PopupMenuButton(
              offset: const Offset(0, 50),
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white60
              ),
              color: const Color.fromARGB(255, 28, 45, 42),
              itemBuilder:(context) => [
                PopupMenuItem(
                  value: 'Invite a friend', 
                  onTap: () async {
                    await listApps(true).then(
                      (result) {
                        ShowBottomSheet(
                          context: context,
                          applications: result,
                          getInviteMessageApps: true
                        ).displayIcons();
                      }
                    );
                  },
                  child: const CustomTextWidget(
                    color: Colors.white,
                    size: 16,
                    fontWeight: FontWeight.w400,
                    text: 'Invite a friend'
                  )
                ),
                PopupMenuItem(
                  value: 'Contacts',
                  onTap: () async{
                    await launchContactsApp();
                  },
                  child: const CustomTextWidget(
                    color: Colors.white,
                    size: 16,
                    fontWeight: FontWeight.w400,
                    text: 'Contacts'
                  )
                ),
                const PopupMenuItem(
                  value: 'Refresh', 
                  child: CustomTextWidget(
                    color: Colors.white,
                    size: 16,
                    fontWeight: FontWeight.w400,
                    text: 'Refresh'
                  )
                ),
                const PopupMenuItem(
                  value: 'Help', 
                  child: CustomTextWidget(
                    color: Colors.white,
                    size: 16,
                    fontWeight: FontWeight.w400,
                    text: 'Help'
                  )
                ),              
              ],
            )
          ],        
        ),
      
      
        body: FutureBuilder <List<Contact>>(
          future: getContacts(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 38, 165, 132)
                )
              );
            } 
            else {
              final List<Contact> listOfContacts = snapshot.data ?? [] ; 
              if(listOfContacts.isNotEmpty){                           
                return ListView.builder(
                  itemCount: listOfContacts.length + 3,
                  itemBuilder: (context, index) {
                    if (index == 0){
                      return ListTile(
                        tileColor: const Color.fromARGB(255, 0, 22, 26),
                        contentPadding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
                        leading: const CustomCircleAvatar(
                          radius: 20,
                          color:Color.fromARGB(255, 38, 165, 132),
                          child: Icon(Icons.people, color: Colors.white)
                        ),
                        title: CustomTextWidget(
                          color: Colors.blueGrey.shade400,
                          size: 18,
                          fontWeight: FontWeight.w400,
                          text: 'New group'
                        )
                      );
                    }
                    else if (index == 1){
                      return ListTile(
                        tileColor: const Color.fromARGB(255, 0, 22, 26),
                        contentPadding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
                        leading: const CustomCircleAvatar(radius: 20, color:Color.fromARGB(255, 38, 165, 132),
                          child: Icon(Icons.person_add, color: Colors.white)
                        ),
                        title: CustomTextWidget(color: Colors.blueGrey.shade400, size: 18, 
                          fontWeight: FontWeight.w400, text: 'New contact'
                        )
                      );
                    }
                    else if (index == 2){
                      return ListTile(
                        tileColor: const Color.fromARGB(255, 0, 22, 26),
                        contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        title: CustomTextWidget(color:Colors.blueGrey.shade400, size:15, 
                          fontWeight:FontWeight.w400, text:'Contacts on WhatsApp'
                        ),
                      );
                    }
      
                    final contact = listOfContacts[index - 3];                  
                    return ListTile(
                      tileColor: const Color.fromARGB(255, 0, 22, 26),
                      contentPadding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
                      leading: const CircleAvatar(radius: 20,),
                      title: CustomTextWidget(
                        color: Colors.white70, size:17, fontWeight: FontWeight.w400, text: contact.displayName ?? ''
                      )
                      //subtitle: Text(contact.phones![0].value ?? ''),
                    );
                  }
                );
              }
              else {
                return Center(
                  child: CustomTextWidget(
                    color: Colors.blueGrey.shade400, size:17, fontWeight: FontWeight.w400, text: 'Unable to fectch your contacts'
                  )
                );
              }
            }
          }
        )
      ),
    );
  }
}