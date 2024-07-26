import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/stores/todo.store.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final todoStore = Modular.get<TodoStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TODO do LEO')),
      body: Center(
        child: Observer(
            builder: (context) => Column(
                  children: todoStore.todos
                      .map((todo) => ElevatedButton(
                            onPressed: () =>
                                Modular.to.pushNamed('/detalhe/${todo.id}'),
                            child: Text(todo.titulo),
                          ))
                      .toList(),
                )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Modular.to.pushNamed('/inclusao'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
