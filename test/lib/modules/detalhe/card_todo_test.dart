import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ola_flutter_modular/core/models/todo.model.dart';
import 'package:ola_flutter_modular/modules/detalhe/card.todo.dart';

void main() {
  testWidgets('CardTodo displays the correct title',
          (WidgetTester tester) async {
        // Create a Todo instance for testing
        const todo = Todo(
          id: "1",
          titulo: 'Test Todo',
        );

        // Build the CardTodo widget with the test Todo
        await tester.pumpWidget(
          const MaterialApp(
            home: CardTodo(
              todo: todo,
            ),
          ),
        );

        // Verify that the title is displayed correctly
        expect(find.text('Título:'), findsOneWidget);
        expect(find.text(todo.titulo), findsOneWidget);
        expect(find.text('xpto'), findsNothing);
      });
}