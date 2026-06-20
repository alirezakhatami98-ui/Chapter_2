void main() {
  List<int> numbers = List.generate(10, (index) => index + 1);

  numbers.where((n) => n % 2 == 0).map((n) => n * n).forEach(print);
}
