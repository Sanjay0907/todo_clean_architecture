// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo {
  final int id;
  final String text;
  final bool isCompleted;
  Todo({
    required this.id,
    required this.text,
    this.isCompleted = false,
  });

  Todo toggleCompletion() {
    return Todo(
      id: id,
      text: text,
      isCompleted: !isCompleted,
    );
  }
}
