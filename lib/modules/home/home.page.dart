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
    fetchTodos();
  }

  Future<void> fetchTodos() async {
    setState(() => isLoading = true);
    await todoStore.fetchTodos();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => isLoading = false);
    });
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
