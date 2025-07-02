import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/domain/models/todo.dart';
import 'package:todo_bloc/presentation/bloc/todo_cubit.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  _showTodoAddBox(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    final textController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          // Cancle
          TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel')),
          // Add
          TextButton(
            onPressed: () {
              todoCubit.addTodo(
                textController.text.trim(),
              );
              Navigator.of(context).pop();
            },
            child: const Text(
              'Add',
            ),
          )
        ],
        content: TextField(
          controller: textController,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTodoAddBox(context),
        child: Icon(
          Icons.add,
        ),
      ),
      body: BlocBuilder<TodoCubit, List<Todo>>(builder: (context, todos) {
        return ListView.builder(
            itemCount: todos.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              Todo todo = todos[index];
              return ListTile(
                leading: Checkbox(
                    value: todo.isCompleted,
                    onChanged: (value) =>
                        todoCubit.toggleCompletionofTodo(todo)),
                title: Text(todo.text),
                trailing: IconButton(onPressed: ()=> todoCubit.deleteTodo(todo), icon: Icon(Icons.cancel)),
              );
            });
      }),
    );
  }
}
