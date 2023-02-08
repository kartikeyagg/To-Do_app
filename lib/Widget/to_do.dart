import 'package:flutter/material.dart';
import '../Model/to_do_m.dart';

class ToDoItem extends StatelessWidget {
  final ToDO todo;
  final onTOdochanged;
  final ondeleteitem;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onTOdochanged,
    required this.ondeleteitem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 1, vertical: 5),
        child: ListTile(
          onTap: () {
            // print("hello");
            onTOdochanged(todo);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          tileColor: Color(0xfff8f1f1),
          leading: todo.isDone
              ? Icon(
                  Icons.check_box,
                  color: Colors.blue,
                )
              : Icon(
                  Icons.check_box_outline_blank,
                  color: Colors.blue,
                ),
          title: Text(todo.todoText!,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  decoration: todo.isDone ? TextDecoration.lineThrough : null)),
          trailing: Container(
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: IconButton(
                color: Colors.white,
                icon: Icon(
                  Icons.delete,
                  size: 20,
                ),
                onPressed: () {
                  // print("Delete Button");
                  ondeleteitem(todo.id);
                },
              ),
            ),
          ),
        ));
  }
}
