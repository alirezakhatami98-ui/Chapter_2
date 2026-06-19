import 'dart:io';

class Contact {
  String name, phone;

  Contact(this.name, this.phone);
}

void main() {
  List<Contact> contacts = [];
  contacts.add(Contact('Ali', '09324567831'));
  contacts.add(Contact('Sara', '09653715239'));
  contacts.add(Contact('Mohammad', '09456218943'));

  for (var contact in contacts) {
    print('Name : ${contact.name}, Phone : ${contact.phone}');
  }

  stdout.write('Who do you want to find? ');
  String? find = stdin.readLineSync();
  String? found;
  for (var contact in contacts) {
    if (find == contact.name) {
      found = 'Name : ${contact.name}, Phone : ${contact.phone}';
      print(found);
    }
  }
  if (found == null) {
    print('No contact found!');
  }
}
