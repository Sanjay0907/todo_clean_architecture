import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/domain/repository/todo_repo.dart';
import 'package:todo_bloc/presentation/bloc/todo_cubit.dart';
import 'package:todo_bloc/presentation/widgets/todo_view.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key, required this.todoRepo});
  final TodoRepo todoRepo;
  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(
        widget.todoRepo,
      ),
      child: const TodoView(),
    );
  }
}
