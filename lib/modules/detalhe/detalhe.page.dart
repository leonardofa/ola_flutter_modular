import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ola_flutter_modular/core/models/todo.model.dart';

import '../../core/stores/todo.store.dart';

class DetalhePage extends StatefulWidget {
  DetalhePage({super.key, required this.id});

  final String id;

  @override
  State<DetalhePage> createState() => _DetalhePageState(id);
}

class _DetalhePageState extends State<DetalhePage> {
  final todoStore = Modular.get<TodoStore>();
  bool isLoading = false;
  Todo todo = const Todo(id: "id", titulo: "titulo");

  _DetalhePageState(String id) {
    todo = Todo(id: id, titulo: '');
  }

  @override
  void initState() {
    super.initState();
    fetchDados();
  }

  Future<void> fetchDados() async {
    setState(() => isLoading = true);
    todo = await todoStore.findById(todo.id);
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalhe [${todo.id}]')),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Column(
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
                        onPressed: () => remove(todo, context),
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

  void remove(Todo todo, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Excluir Todo'),
          content: const Text('Tem certeza que deseja excluir este todo?'),
          actions: [
            TextButton(
              onPressed: () {
                todoStore.remove(todo.id);
                Modular.to.popUntil((route) => route.settings.name == '/');
              },
              child: const Text('Sim'),
            ),
            TextButton(
              onPressed: () {
                Modular.to.pop();
              },
              child: const Text('Não'),
            ),
          ],
        );
      },
    );
  }
}
