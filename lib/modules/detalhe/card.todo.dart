import 'package:flutter/material.dart';

import '../../core/models/todo.model.dart';

class CardTodo extends StatelessWidget {
  const CardTodo({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Título:"),
        Text(todo.titulo),
      ],
    );
  }
}