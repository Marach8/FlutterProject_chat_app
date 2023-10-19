import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class GetContacts{

  Future<List<Contact>> getContacts() async{
    if(await Permission.contacts.status.isGranted){
      print('status is Granted');
      final List<Contact> contacts = await ContactsService.getContacts();
      //for (var contact in contacts) print(contact.displayName);
      //print(contacts.length);
      return contacts;
    }
    else {
      await Permission.contacts.request();
      return [];
    }
  }
}