class Person {
  String name;
  int age;

  Person(this.name, this.age);

  static const int currentYear = 1404;
  Person.fromBirthYear(this.name, int birthYear)
    : age = currentYear - birthYear;

  void greet() {
    print('Hello, my name is $name & I am $age years old.');
  }
}

void main() {
  var person1 = Person.fromBirthYear('S.Alireza', 1375);
  person1.greet();
}
