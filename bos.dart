import 'dart:async';

class Person {
  final String name;
  final int age;

  Person(this.name, this.age);

  @override
  int compareTo(Person other) {
    return name.compareTo(other.name); // İsmine göre sırala
  }
}

var _order = 'd';

final _todos = [
  Person(
    'a',
    12,
  ),
  Person(
    'b',
    33,
  ),
  Person(
    'c',
    23,
  ),
];

List<Person> get _orderedTodos {
  final sortedTodos = List.of(_todos);
  sortedTodos.sort((bb, aa) {
    final bComesAfterA = bb.age.compareTo(aa.age);

    return _order == "sds" ? bComesAfterA : -bComesAfterA;
  });
  return sortedTodos;
}

void main() {
  _orderedTodos.forEach(
    (element) {
      print(element.age);
    },
  );
}
