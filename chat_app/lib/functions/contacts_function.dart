import 'package:contacts_service/contacts_service.dart';
import 'package:device_apps/device_apps.dart';
import 'package:permission_handler/permission_handler.dart';


Future<List<Contact>> getContacts() async{
  if(await Permission.contacts.status.isGranted) {return await ContactsService.getContacts();}
  else {
    await Permission.contacts.request();
    if (await Permission.contacts.status.isGranted){return ContactsService.getContacts();}
    else {return [];}
  }
}


Future<void> launchContactsApp() async{
  List<Application> app = await DeviceApps.getInstalledApplications(
    includeSystemApps: true, includeAppIcons: true, onlyAppsWithLaunchIntent: true
  );
  for (var item in app){if(item.packageName.contains('contacts') && item.systemApp){item.openApp();}}
}