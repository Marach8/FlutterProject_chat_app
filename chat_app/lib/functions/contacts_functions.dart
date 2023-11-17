import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher_string.dart';

class GetContacts{

  Future<List<Contact>> getContacts() async{
    if(await Permission.contacts.status.isGranted) {return await ContactsService.getContacts();}
    else {
      await Permission.contacts.request();
      if (await Permission.contacts.status.isGranted){return ContactsService.getContacts();}
      else {return [];}
    }
  }
}

class AccessContactsApp {
  
  void accessContactsApp() async{
    const url = 'contacts:';
    if(await canLaunchUrlString(url)){
      await launchUrlString(url);
    }
  }
}