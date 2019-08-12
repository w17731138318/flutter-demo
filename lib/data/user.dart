class User {
  String name;
  String sex;
  int age;

  User(this.name, this.sex, this.age);

  @override
  String toString() {
    return 'User{name: $name, sex: $sex, age: $age}';
  }
}
