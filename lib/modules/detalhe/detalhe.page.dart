import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ola_flutter_modular/core/models/todo.model.dart';

import '../../core/stores/todo.store.dart';

class DetalhePage extends StatelessWidget {
  DetalhePage({super.key, required this.id});

  final int id;

  final todoStore = Modular.get<TodoStore>();

  @override
  Widget build(BuildContext context) {
    var todo = todoStore.findById(id);
    return Scaffold(
      appBar: AppBar(title: Text('Detalhe [${todo.id}]')),
      body: Center(
        child: Column(
          children: [
            Text('Detalhando: ${todo.titulo}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => Modular.to.pop(),
                  child: const Text('Voltar'),
                ),
                IconButton(
                  onPressed: () => onPressed(todo),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onPressed(Todo todo) {
    todoStore.remove(todo.id);
    Modular.to.pop();
  }

}
