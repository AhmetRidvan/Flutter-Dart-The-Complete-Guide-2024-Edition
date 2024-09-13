// Öğrenci sınıfı: Her öğrenci bir ad ve not ile temsil edilir.
class Student {
  Student({required this.name, required this.grade});
  
  String name;  // Öğrencinin adı
  double grade; // Öğrencinin notu
}

// Sınıf için bir sınıf tanımlıyoruz: Belirli bir sınıfa ait öğrencilerin listesini tutar.
class ClassGroup {
  ClassGroup({required this.className, required this.students});
  
  // Belirli bir sınıfa ait olan öğrencileri filtreler.
  ClassGroup.forClass(List<Student> allStudents, this.className)
      : students = allStudents
            .where((student) => student.name.startsWith(className))
            .toList();

  String className;  // Sınıfın adı
  List<Student> students;  // Sınıfa ait öğrenciler

  // Sınıfa ait öğrencilerin notlarının toplamını hesaplar.
  double get totalGrades {
    double total = 0;

    for (var student in students) {
      total += student.grade;
    }

    return total;
  }
}

void main() {
  // Tüm öğrenciler
  List<Student> allStudents = [
    Student(name: 'ClassA - John', grade: 85),
    Student(name: 'ClassA - Alice', grade: 90),
    Student(name: 'ClassB - Bob', grade: 70),
    Student(name: 'ClassB - Charlie', grade: 75),
  ];

  // ClassA sınıfındaki öğrencileri al
  ClassGroup classA = ClassGroup.forClass(allStudents, 'ClassA');

  // ClassA'daki öğrencilerin toplam notlarını yazdır
  print('ClassA toplam not: ${classA.totalGrades}');
}
