import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colors.dart';
import 'package:to_do_app/model/todo.dart';

import 'todo_item.dart';

class Home extends StatefulWidget {
  Home({Key? key,}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = Todo.todoList();
  final _todoController = TextEditingController();
  List<Todo> filtedList = [];

  @override
  void initState() {
    filtedList = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                _buildSearchBar(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 18),
                        child: Text(
                          'All TODO ITEMS',
                          style: TextStyle(
                            color: tdBlue,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for (Todo item in filtedList)
                        TODOITEMS(
                          todo: item,
                          onTodoChange: _handleToDoChange,
                          onDeleteItem: _handleDeleteTodo,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                        hintText: 'Add new todo item',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: tdBlue,
                      minimumSize: Size(50, 50),
                      elevation: 10,
                    ),
                    onPressed: () {
                      //implement action to add new todo item
                      _addTodoItems(_todoController.text);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _handleToDoChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _handleDeleteTodo(String id) {
    setState(() {
      todosList.removeWhere((element) => element.id == id);
    });
  }

  void _addTodoItems(String todoItem) {
    setState(() {
      todosList.add(
        Todo(
          id: DateTime.now().millisecond.toString(),
          todoText: todoItem,
        ),
      );
      todosList.reversed;
    });
    _todoController.clear();
  }

  void _searchTodoItems(String searchText){
    List<Todo> results = [];
    if(searchText.isEmpty){
      results = todosList;
    }else{
      results = todosList.where((element) => element.todoText!.toLowerCase().contains(searchText.toLowerCase())).toList();
    }

    setState((){
      filtedList=results;
    });
  }

  Container _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: (value) => _searchTodoItems(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            maxWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search here',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
          ),
          Icon(
            Icons.person,
            color: tdBlack,
            size: 30,
          )
        ],
      ),
    );
  }
}
