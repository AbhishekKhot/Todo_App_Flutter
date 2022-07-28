import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colors.dart';
import 'package:to_do_app/model/todo.dart';

class TODOITEMS extends StatelessWidget {
  final Todo todo;
  final onTodoChange;
  final onDeleteItem;

  const TODOITEMS({
    Key? key,
    required this.todo,
    required this.onTodoChange,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          //implement action for check and uncheck
          onTodoChange(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
              fontSize: 16,
              color: tdBlack,
              decoration: todo.isDone ? TextDecoration.lineThrough:null,),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdBoxColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 20,
            icon: Icon(Icons.delete),
            onPressed: () {
              //implement action to delete the todo item from list
              onDeleteItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}
