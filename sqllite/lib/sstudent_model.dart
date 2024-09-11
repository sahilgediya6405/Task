class Student {
  int id;
  String name;
  int mark;
  String city;

  Student(
      {required this.id,
      required this.name,
      required this.mark,
      required this.city});

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
        id: map['id'], 
        name: map['name'],
        mark: map['mark'], 
        city: map['city']);
  }
}
