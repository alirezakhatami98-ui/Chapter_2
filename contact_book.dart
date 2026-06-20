import 'dart:io';

class Contact {
  String name, phone;

  Contact(this.name, this.phone);
}

class ContactManager {
  List<Contact> contacts = [];

  void addContact() {
    String? addName;
    do {
      stdout.write("Input contact's name: ");
      addName = stdin.readLineSync();

      if (addName == null || addName.isEmpty) {
        print('Please input valid name!');
      } else {
        print("Contact's name saved.");
      }
    } while (addName == null || addName.isEmpty);

    String? addPhone;
    do {
      stdout.write("Input contact's phone: ");
      addPhone = stdin.readLineSync();

      if (addPhone == null || addPhone.isEmpty) {
        print('Please input valid phone!');
      } else {
        print("Contact's phone saved.");
      }
    } while (addPhone == null || addPhone.isEmpty);
    contacts.add(Contact(addName, addPhone));
    print('Name : $addName, Phone : $addPhone');
  }

  void showAll() {
    if (contacts.isEmpty) {
      print('No contact found!');
      return;
    }
    for (var contact in contacts) {
      print('Name : ${contact.name}, Phone : ${contact.phone}');
    }
  }

  Contact? findContact(String name) {
    for (var contact in contacts) {
      if (name == contact.name) {
        return contact;
      }
    }
    print('Contact not found');
    return null;
  }

  void searchContact() {
    stdout.write('Who do you want to find? ');
    String? find = stdin.readLineSync();
    if (find == null || find.isEmpty) {
      print('Please input valid name!');
      return;
    }
    Contact? foundContact = findContact(find);
    if (foundContact != null) {
      print('Name : ${foundContact.name}, Phone : ${foundContact.phone}');
    }
  }

  void deleteContact() {
    stdout.write('Who do you want to delete? ');
    String? find = stdin.readLineSync();
    if (find == null || find.isEmpty) {
      print('Please input valid name!');
      return;
    }
    Contact? contactToDelete = findContact(find);
    if (contactToDelete != null) {
      contacts.remove(contactToDelete);
      print('Contact deleted!');
    }
  }
}

int getMenuNumber() {
  int? optNum;
  do {
    stdout.write('Enter the desired option number: ');
    String? optNumStr = stdin.readLineSync();
    optNum = int.tryParse(optNumStr ?? '');

    if (optNum == null || optNum < 1 || optNum > 5) {
      print('Please input valid integer number between 1 & 5.');
    }
  } while (optNum == null);
  return optNum;
}

void main() {
  ContactManager contactManager = ContactManager();

  int? optNum;
  do {
    print('1. Add contact\n2. Show all\n3. Search\n4. delete\n5. Exit');
    optNum = getMenuNumber();
    switch (optNum) {
      case 1:
        contactManager.addContact();
        break;
      case 2:
        contactManager.showAll();
        break;
      case 3:
        contactManager.searchContact();
        break;
      case 4:
        contactManager.deleteContact();
        break;
      case 5:
        print('Exiting...');
        break;
    }
  } while (optNum != 5);
}
