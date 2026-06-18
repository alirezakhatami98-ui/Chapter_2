class Rectangle {
  //فیلدها، ویژگی ها
  double width;
  double height;

  //Constructor
  Rectangle(this.width, this.height);

  //Method
  double area() {
    return width * height;
  }
}

void main() {
  var rectangle1 = Rectangle(5, 3);
  double rectArea = rectangle1.area();
  print('Area of rectangle: $rectArea');
}
