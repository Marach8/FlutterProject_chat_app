import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class GetContacts{

  Future<List<Contact>> getContacts() async{
    if(await Permission.contacts.status.isGranted){
      final List<Contact> contacts = await ContactsService.getContacts();
      return contacts;
    }
    else {
      await Permission.contacts.request();
      final List<Contact> contacts = await ContactsService.getContacts();
      return contacts;
    }
  }
}