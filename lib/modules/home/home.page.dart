import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/stores/todo.store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todoStore = Modular.get<TodoStore>();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchDados();
  }

  Future<void> fetchDados() async {
    setState(() => isLoading = true);
    await todoStore.fetchTodos();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TODO do LEO')),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Observer(
                builder: (context) => Column(
                      children: todoStore.todos
                          .map((todo) => ElevatedButton(
                                onPressed: () =>
                                    Modular.to.pushNamed('/detalhe/${todo.id}').then((_) => todoStore.fetchTodos()),
                                child: Text(todo.titulo),
                              ))
                          .toList(),
                    )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Modular.to.pushNamed('/inclusao').then((_) => todoStore.fetchTodos()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
