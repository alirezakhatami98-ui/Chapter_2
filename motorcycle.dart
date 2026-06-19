class Vehicle {
  String brand;
  int year;

  Vehicle(this.brand, this.year);

  void displayInfo() {
    print(
      'The specifications of this vehicle; Brand: $brand, Year of manufacture: $year',
    );
  }
}

class Motorcycle extends Vehicle {
  bool hasSidecar;

  Motorcycle(String brand, int year, this.hasSidecar) : super(brand, year);

  @override
  void displayInfo() {
    super.displayInfo();
    print('Has sidecar? $hasSidecar');
  }
}

void main() {
  var myMotorcycle = Motorcycle('Honda', 2017, true);
  myMotorcycle.displayInfo();
}
