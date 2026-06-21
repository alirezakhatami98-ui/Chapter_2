import 'dart:io';

class Contact {
  String name, phone;

  Contact(this.name, this.phone);

  factory Contact.fromCsv(String csv) {
    List<String> parts = csv.split(',');
    if (parts.length != 2) {
      throw FormatException('Invalid CSV format');
    }
    return Contact(parts[0].trim(), parts[1].trim());
  }

  String toCsv() {
    return '$name,$phone';
  }
}

class ContactManager {
  List<Contact> contacts = [];

  void loadContacts() {
    try {
      File file = File('contacts.csv');
      if (file.existsSync()) {
        List<String> lines = file.readAsLinesSync();
        contacts = lines.map((line) => Contact.fromCsv(line)).toList();
        print('Contacts loaded successfully.');
      } else {
        print('No contacts found. Starting with an empty contact list.');
      }
    } catch (e) {
      print('Error loading contacts: $e');
    }
  }

  void saveContacts() {
    try {
      File file = File('contacts.csv');
      List<String> lines = contacts.map((contact) => contact.toCsv()).toList();
      file.writeAsStringSync(lines.join('\n'));
      print('Contacts saved successfully.');
    } catch (e) {
      print('Error saving contacts: $e');
    }
  }

  void addContact(String name, String phone) {
    contacts.add(Contact(name, phone));
    saveContacts();
  }

  List<String> showAll() {
    return contacts
        .map((contact) => 'Name : ${contact.name}, Phone : ${contact.phone}')
        .toList();
  }

  Contact? findContact(String name) {
    for (var contact in contacts) {
      if (name == contact.name) {
        return contact;
      }
    }
    return null;
  }

  Contact? deleteContact(String name) {
    Contact? foundContact = findContact(name);
    if (foundContact != null) {
      contacts.remove(foundContact);
      saveContacts();
      return foundContact;
    } else {
      return null;
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

String getValidName() {
  while (true) {
    stdout.write("Enter name: ");
    String? input = stdin.readLineSync();

    if (input != null && input.isNotEmpty) {
      return input;
    }

    print('Invalid name!');
  }
}

String getValidPhone() {
  while (true) {
    stdout.write("Enter phone: ");
    String? input = stdin.readLineSync();

    if (input != null && input.isNotEmpty) {
      return input;
    }

    print('Invalid phone!');
  }
}

void main() {
  ContactManager contactManager = ContactManager();
  contactManager.loadContacts();

  int optNum;

  do {
    print('\n1. Add contact\n2. Show all\n3. Search\n4. Delete\n5. Exit');
    optNum = getMenuNumber();

    switch (optNum) {
      case 1:
        final name = getValidName();
        final phone = getValidPhone();

        contactManager.addContact(name, phone);
        print('Contact added successfully.');
        break;

      case 2:
        final list = contactManager.showAll();

        if (list.isEmpty) {
          print('No contact found!');
        } else {
          list.forEach(print);
        }
        break;

      case 3:
        final name = getValidName();
        final result = contactManager.findContact(name);

        if (result != null) {
          print('Name: ${result.name}, Phone: ${result.phone}');
        } else {
          print('Contact not found');
        }
        break;

      case 4:
        final name = getValidName();
        final deleted = contactManager.deleteContact(name);
        print(deleted != null ? 'Contact deleted!' : 'Contact not found');
        break;

      case 5:
        print('Exiting...');
        break;
    }
  } while (optNum != 5);
}
