import 'package:flutter/material.dart';

class ToDO {
  String? id;
  String? todoText;
  bool isDone;

  ToDO({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDO> todoList() {
    return [
      ToDO(id: '01', todoText: 'Water Drink', isDone: true),
      ToDO(id: '02', todoText: 'Morning Excerse', isDone: true),
      ToDO(id: '03', todoText: 'Check Emails', isDone: false),
      ToDO(id: '04', todoText: 'Meditation', isDone: true),
      ToDO(id: '05', todoText: 'Breakfast', isDone: false),
      ToDO(id: '06', todoText: 'Work', isDone: true),
      ToDO(id: '07', todoText: 'Look for Jobs', isDone: false),
    ];
  }
}
