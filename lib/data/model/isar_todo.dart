import 'package:todo_bloc/domain/models/todo.dart';

class TodoIsar {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isCompleted;

//! CONVERT ISAR OBJECT TO PURE TODO OBJECT
  Todo toDomain() {
    return Todo(
      id: id,
      text: text,
      isCompleted: isCompleted,
    );
  }

//! CONVERT TODO OBJECT TO ISAR OBJECT
  static TodoIsar fromDomain(Todo todo) {
    return TodoIsar()
      ..id = todo.id
      ..text = todo.text
      ..isCompleted = todo.isCompleted;
  }
}
