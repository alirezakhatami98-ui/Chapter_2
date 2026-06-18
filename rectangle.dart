class Rectangle {
  //فیلدها، ویژگی ها
  double width;
  double height;

  //Constructor
  Rectangle(this.width, this.height);

  //Method
  void area() {
    print(
      'The area of rectangle with width of $width & height of $height is ${width * height}',
    );
  }
}

void main() {
  var rectangle1 = Rectangle(5, 3);
  rectangle1.area();
}
