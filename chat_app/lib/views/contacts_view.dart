import 'package:chat_app/functions/get_contacts.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        title: const Column(
          children: [
            Text('Select contact'),
            Text('954 contacts')
          ]
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_rounded), 
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
      body: FutureBuilder <List<Contact>>(
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
                  print(index);
                  final contact = listOfContacts[index];                  
                  return ListTile(
                    leading: const CircleAvatar(radius: 10,),
                    title: Text(
                      contact.displayName ?? '',
                      style: GoogleFonts.getFont(
                        'Nunito', color: Colors.white70
                      )
                    ),
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
      )
    );
  }
}