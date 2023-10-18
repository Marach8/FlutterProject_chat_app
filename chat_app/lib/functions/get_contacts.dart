import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> getContacts() async{
  final status = await Permission.contacts.request();
  if (status.isGranted){
    print('status is Granted');
    final Iterable<Contact> contacts = await ContactsService.getContacts();
    for (var contact in contacts) print(contact.displayName);
  } else{
    print('Could not fetch contacts');
  }
}