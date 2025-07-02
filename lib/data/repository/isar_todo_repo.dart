import 'package:isar/isar.dart';
import 'package:todo_bloc/data/model/isar_todo.dart';
import 'package:todo_bloc/domain/models/todo.dart';
import 'package:todo_bloc/domain/repository/todo_repo.dart';

class IsarTodoRepo implements TodoRepo {
  final Isar db;
  IsarTodoRepo(this.db);

  // get TODOs
  @override
  Future<List<Todo>> getTodos() async {
    final todos = await db.todoIsars.where().findAll();
    return todos.map((todoIsar) => todoIsar.toDomain()).toList();
  }

  @override
  Future<void> addTodo(Todo todo) async {
    final todoIsar = TodoIsar.fromDomain(todo);
    return db.writeTxn(
      () => db.todoIsars.put(
        todoIsar,
      ),
    );
  }

  @override
  Future<void> updateTodo(Todo todo) async {
    final todoIsar = TodoIsar.fromDomain(todo);
    return db.writeTxn(
      () => db.todoIsars.put(
        todoIsar,
      ),
    );
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    await db.writeTxn(
      () => db.todoIsars.delete(
        todo.id,
      ),
    );
  }
}
