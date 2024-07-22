import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: Center(
        child: Column(
          children: [
            Text('Detalhando id: $id'),
            ElevatedButton(
              onPressed: () => Modular.to.navigate('/'),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}