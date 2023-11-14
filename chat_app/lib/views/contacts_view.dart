import 'package:chat_app/custom_widgets/circle_avatar.dart';
import 'package:chat_app/custom_widgets/text_widget.dart';
import 'package:chat_app/functions/contacts_functions.dart';
import 'package:chat_app/functions/invite_message_functions.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class ContactsView extends StatefulWidget {
  const ContactsView({super.key});

  @override
  State<ContactsView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactsView> {
  bool searchContacts = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900, foregroundColor: Colors.white60,
        title: Builder(
          builder: (context) {
            return Row(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1000),
                  child: !searchContacts? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextWidget(color: Colors.blueGrey.shade400, size: 20, fontWeight: FontWeight.w400, text: 'Select contact',),
                      const CustomTextWidget(color: Colors.white, size: 14, fontWeight: FontWeight.w400, text: '954 contacts',)
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
                icon: const Icon(Icons.search_rounded, color: Colors.white), 
                onPressed: (){
                  setState(() => searchContacts = true);
                }
              );
            }
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert, color: Colors.white60),
            color: const Color.fromARGB(255, 28, 45, 42),
            itemBuilder:(context) => [
              PopupMenuItem(
                value: 'item1', 
                onTap: () async {listApps(); await displayIcons(context);},
                child: const CustomTextWidget(color: Colors.white, size: 16, fontWeight: FontWeight.w400, text: 'Invite a friend')
              ),
              const PopupMenuItem(
                value: 'item2', 
                child: CustomTextWidget(color: Colors.white, size: 16, fontWeight: FontWeight.w400, text: 'Contacts')
              ),
              const PopupMenuItem(
                value: 'item3', 
                child: CustomTextWidget(color: Colors.white, size: 16, fontWeight: FontWeight.w400, text: 'Refresh')
              ),
              const PopupMenuItem(
                value: 'item4', 
                child: CustomTextWidget(color: Colors.white, size: 16, fontWeight: FontWeight.w400, text: 'Help')
              ),              
            ],
          )
        ],        
      ),


      body: FutureBuilder <List<Contact>>(
        future: GetContacts().getContacts(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(color: Color.fromARGB(255, 38, 165, 132)));
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
                      leading: const CustomCircleAvatar(radius: 20, color:Color.fromARGB(255, 38, 165, 132),
                        child: Icon(Icons.people, color: Colors.white)
                      ),
                      title: CustomTextWidget(color: Colors.blueGrey.shade400, size: 18, fontWeight: FontWeight.w400, text: 'New group')
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
    );
  }
}