import 'dart:math';

mixin Identifiable {
  void showId() {
    var random = Random();
    var id = 1000 + random.nextInt(9000);
    print('Id ($runtimeType): $id');
  }
}

class Teacher with Identifiable {}

class Student with Identifiable {}

void main() {
  var teacher = Teacher();
  var student = Student();
  teacher.showId();
  student.showId();
}
