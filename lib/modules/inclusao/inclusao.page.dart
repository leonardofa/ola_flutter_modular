import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/stores/todo.store.dart';

class InclusaoPage extends StatefulWidget {
  const InclusaoPage({super.key});

  @override
  State<InclusaoPage> createState() => _InclusaoPageState();
}

class _InclusaoPageState extends State<InclusaoPage> {
  final todoStore = Modular.get<TodoStore>();

  final _formKey = GlobalKey<FormState>();

  final _tituloController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inclusão de TODO')),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _tituloController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.book), labelText: 'TODO'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor insira um título';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      todoStore.add(_tituloController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('TODO adicionado!')),
                      );
                      Modular.to.pop();
                    }
                  },
                  child: const Text('Salvar TODO'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
