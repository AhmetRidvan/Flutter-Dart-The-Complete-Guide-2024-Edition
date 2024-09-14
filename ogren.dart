// Öğrenci sınıfı: Her öğrenci bir ad ve not ile temsil edilir.
class Student {
  Student({required this.name, required this.grade});

  String name; // Öğrencinin adı
  double grade; // Öğrencinin notu
}

// Sınıf için bir sınıf tanımlıyoruz: Belirli bir sınıfa ait öğrencilerin listesini tutar.
class ClassGroup {
  ClassGroup({required this.className, required this.students});

  String className; // Sınıfın adı
  List<Student> students; // Sınıfa ait öğrenciler

  // Sınıfa ait öğrencilerin notlarının toplamını hesaplar.
  double get totalGrades {
    double total = 0;

    for (var student in students) {
      total += student.grade;
    }

    return total;
  }

  ClassGroup.forClass(List<Student> allStudents)
      : className = "merhaba",
        students = allStudents;
}

void main() {
  // Tüm öğrenciler
  List<Student> allStudents = [
    Student(name: 'ClassA - John', grade: 85),
    Student(name: 'ClassA - Alice', grade: 90),
    Student(name: 'ClassB - Bob', grade: 70),
    Student(name: 'ClassB - Charlie', grade: 75),
    
  ];

  List<Student> someStudents = [
    Student(name: "Zeynep", grade: 93),
    Student(name: "Aleyna", grade: 60),
  ];

  // ClassA sınıfındaki öğrencileri al
  ClassGroup classA = ClassGroup(className: "1B", students: allStudents);

  ClassGroup c1 = ClassGroup.forClass(someStudents);

  // ClassA'daki öğrencilerin toplam notlarını yazdır
  print(classA.className);
  print(classA.students[1].grade);
  print("-----------");
  print(c1.students[0].grade);
}
