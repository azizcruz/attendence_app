class Attendant {
  final String name;
  final int age;
  late DateTime checkInTime;

  void set name(String name) {
    this.name = name;
  }

  void set age(int age) {
    this.age = age;
  }
  Attendant(this.name, this.age) {
    checkInTime =  DateTime.now();
  }
}