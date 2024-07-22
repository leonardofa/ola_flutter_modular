import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Modular.to.navigate('/second/1'),
              child: const Text('Navigate to Second Page [id: 1]'),
            ),
            ElevatedButton(
              onPressed: () => Modular.to.navigate('/second/2'),
              child: const Text('Navigate to Second Page [id: 2]'),
            ),
          ],
        ),
      ),
    );
  }
}