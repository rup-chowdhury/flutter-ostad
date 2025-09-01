abstract class Vehicle {
  int _speed = 0;
  void move();
  void setSpeed(int speed) {
    if (speed >= 0) {
      _speed = speed;
    } else {
      print("Speed cannot be negative");
    }
  }
}

class Car extends Vehicle {
  @override
  void move() {
    print("The car is moving at $_speed km/h");
  }
}

void main() {
  Car myCar = Car();
  myCar.setSpeed(80);
  myCar.move();
}