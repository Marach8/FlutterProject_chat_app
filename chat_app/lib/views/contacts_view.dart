import 'package:chat_app/custom_widgets/circle_avatar.dart';
import 'package:chat_app/custom_widgets/text_widget.dart';
import 'package:chat_app/functions/get_contacts.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class ContactsView extends StatefulWidget {
  const ContactsView({super.key});

  @override
  State<ContactsView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900, foregroundColor: Colors.white60,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(color: Colors.blueGrey.shade400, size: 20, fontWeight: FontWeight.w400, text: 'Select contact',),
            const CustomTextWidget(color: Colors.white, size: 14, fontWeight: FontWeight.w400, text: '954 contacts',)
          ]
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded, color: Colors.white), 
            onPressed: (){}
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder:(context) => [
              const PopupMenuItem(value: 'item 2', child: Text('Invite a friend'),),
              const PopupMenuItem(value: 'item 2', child: Text('Contacts'),),
              const PopupMenuItem(value: 'item 2', child: Text('Refresh'),),
              const PopupMenuItem(value: 'item 2', child: Text('Help'),),
            ],
          )
        ],        
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 0, 15),
            child: Row(
              children: [
                const CustomCircleAvatar(radius: 20, color:Color.fromARGB(255, 38, 165, 132),
                  child: Icon(Icons.people, color: Colors.white)
                ), const SizedBox(width: 15),
                CustomTextWidget(color: Colors.blueGrey.shade400, size: 18, fontWeight: FontWeight.w400, text: 'New group')
              ]
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 12, 0, 15),
            child: Row(
              children: [
                const CustomCircleAvatar(radius: 20, color:Color.fromARGB(255, 38, 165, 132),
                  child: Icon(Icons.person_add, color: Colors.white)
                ), const SizedBox(width: 15),
                CustomTextWidget(color: Colors.blueGrey.shade400, size: 18, fontWeight: FontWeight.w400, text: 'New contact')
              ]
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 0, 15),
            child: CustomTextWidget(color:Colors.blueGrey.shade400, size:15, fontWeight:FontWeight.w400, text:'Contacts on WhatsApp'),
          ),
          Expanded(
            child: FutureBuilder <List<Contact>>(
              future: GetContacts().getContacts(),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator());
                } 
                else {
                  final List<Contact>? listOfContacts = snapshot.data ; 
                  if(listOfContacts!.isNotEmpty){                           
                    return ListView.builder(
                      itemCount: listOfContacts.length,
                      itemBuilder: (context, index) {
                        final contact = listOfContacts[index];                  
                        return ListTile(
                          leading: const CircleAvatar(radius: 20,),
                          title: CustomTextWidget(
                            color: Colors.white, size:15, fontWeight: FontWeight.w400, text: contact.displayName ?? ''
                          )
                          // title: Text(
                          //   contact.displayName ?? '',
                          //   style: const TextStyle(
                          //     fontFamily: 'sans-serrif', color: Colors.white70
                          //   )
                          // ),
                          //subtitle: Text(contact.phones![0].value ?? ''),
                        );
                      }
                    );
                  }
                  else {
                    return const Center(child: Text('Unable to fectch your contacts'));              
                  }
                }
              }
            ),
          ),
        ],
      )
    );
  }
}