import 'package:flutter/material.dart';
import 'package:todoapp/main.dart';
import '../Widget/to_do.dart';
import '../Model/to_do_m.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = ToDO.todoList();
  List<ToDO> _foundTodo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundTodo = todoList;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff9f9f9),
        appBar: _buildAppBar(),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  searchBox(),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 50, bottom: 20),
                            child: Text("ALL ToDos",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                ))),
                        for (ToDO t1 in _foundTodo)
                          ToDoItem(
                            todo: t1,
                            onTOdochanged: _handleToDochange,
                            ondeleteitem: _deletetodoitem,
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      left: 20,
                      right: 20,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 10.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                        hintText: "Add a new todo item",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                    color: Colors.blue,
                    margin: EdgeInsets.only(
                      bottom: 20,
                      // left: 20,
                      right: 20,
                    ),
                    child: ElevatedButton(
                      child: Text(
                        "+",
                        style: TextStyle(fontSize: 40),
                      ),
                      onPressed: () {
                        _addToDoItem(_todoController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        minimumSize: Size(60, 60),
                        elevation: 20,
                      ),
                    )),
              ]),
            ),
          ],
        ));
  }

  void _handleToDochange(ToDO todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deletetodoitem(String id) {
    setState(() {
      todoList.removeWhere((element) => element.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todoList.add(ToDO(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo));

      _todoController.clear();
    });
  }

  void _runFilter(String key) {
    List<ToDO> result = [];

    if (key.isEmpty) {
      result = todoList;
    } else {
      result = todoList
          .where((item) =>
              item.todoText!.toLowerCase().contains(key.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundTodo = result;
    });
  }

  Widget searchBox() {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
          color: Color(0xffece9e9), borderRadius: BorderRadius.circular(20)),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search, color: Colors.grey, size: 20),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
      elevation: 0,
      backgroundColor: Color(0xfff9f9f9),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: Colors.grey,
          ),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/Images/me.jpeg'),
          )
        ],
      ));
}
