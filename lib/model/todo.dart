class Todo {
  String? id;
  String? todoText;
  bool isDone;

  Todo({
    required this.id,
    required this.todoText,
    this.isDone=false,
  });

  static List<Todo> todoList() {
    return [
      Todo(id: '01', todoText: 'first check sleep',isDone: true),
      Todo(id: '02', todoText: 'eat healthy',isDone: true),
      Todo(id: '03', todoText: 'learn piano sleep',),
      Todo(id: '04', todoText: 'learn  swimming',),
      Todo(id: '05', todoText: 'other things',),
    ];
  }
}
