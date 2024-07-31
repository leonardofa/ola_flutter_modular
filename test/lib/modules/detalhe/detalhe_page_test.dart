import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ola_flutter_modular/core/models/todo.model.dart';
@GenerateNiceMocks([MockSpec<TodoStore>()])
import 'package:ola_flutter_modular/core/stores/todo.store.dart';
import 'package:ola_flutter_modular/modules/app.module.dart';
import 'package:ola_flutter_modular/modules/detalhe/detalhe.page.dart';

import 'detalhe_page_test.mocks.dart';

void main() {
  group('DetalhePage', () {
    late MockTodoStore mockTodoStore;

    setUp(() {
      mockTodoStore = MockTodoStore();
      Modular.bindModule(AppModule());
      Modular.replaceInstance<TodoStore>(mockTodoStore);
    });

    testWidgets('renders DetalhePage correctly', (WidgetTester tester) async {
      const todo = Todo(
        id: "1",
        titulo: 'Test Todo',
      );

      when(mockTodoStore.findById("1")).thenReturn(todo);

      await tester.pumpWidget(
        MaterialApp(
          home: DetalhePage(
            id: "1",
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Detalhe [1]'), findsOneWidget);
      expect(find.text('Título:'), findsOneWidget);
      expect(find.text('Test Todo'), findsOneWidget);
      expect(find.text('Voltar'), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);
    });

    testWidgets('calls remove method when "Sim" button is pressed',
        (WidgetTester tester) async {
      const todo = Todo(
        id: "1",
        titulo: 'Test Todo',
      );

      when(mockTodoStore.findById("1")).thenReturn(todo);

      await tester.pumpWidget(
        MaterialApp(
          home: DetalhePage(
            id: "1",
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      expect(find.text('Excluir Todo'), findsOneWidget);
      expect(find.text('Tem certeza que deseja excluir este todo?'),
          findsOneWidget);

      await tester.tap(find.text('Sim'));
      await tester.pumpAndSettle();

      verify(mockTodoStore.remove(todo.id)).called(1);
    });

    testWidgets('calls pop method when "Não" button is pressed',
        (WidgetTester tester) async {
      const todo = Todo(
        id: "1",
        titulo: 'Test Todo',
      );

      when(mockTodoStore.findById("1")).thenReturn(todo);

      await tester.pumpWidget(
        MaterialApp(
          home: DetalhePage(
            id: "1",
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      expect(find.text('Excluir Todo'), findsOneWidget);
      expect(find.text('Tem certeza que deseja excluir este todo?'),
          findsOneWidget);

      await tester.tap(find.text('Não'));
      await tester.pumpAndSettle();

      verifyNever(mockTodoStore.remove(todo.id));
    });
  });
}
