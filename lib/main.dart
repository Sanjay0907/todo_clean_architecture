import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_bloc/data/model/isar_todo.dart';
import 'package:todo_bloc/data/repository/isar_todo_repo.dart';
import 'package:todo_bloc/domain/repository/todo_repo.dart';
import 'package:todo_bloc/presentation/pages/todo_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get Directory Path
  final dir = await getApplicationDocumentsDirectory();
  // Open ISAR Database
  final isar = await Isar.open([TodoIsarSchema], directory: dir.path);
  // Initialize the repository with ISAR Database
  final isarTodoRepo = IsarTodoRepo(isar);
  // Run App
  runApp(MyApp(
    todoRepo: isarTodoRepo,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.todoRepo});

  final TodoRepo todoRepo;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TodoScreen(todoRepo: todoRepo),
    );
  }
}
