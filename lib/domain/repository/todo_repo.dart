import 'package:todo_bloc/domain/models/todo.dart';

abstract class TodoRepo {
// get List of TODO
  Future<List<Todo>> getTodos();

// Add a new TODO
  Future<void> addTodo(Todo newTodo);
// Update an existing TODO
  Future<void> updateTodo(Todo todo);
// Delete a TODO
  Future<void> deleteTodo(Todo todo);
}
