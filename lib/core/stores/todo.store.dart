import 'package:mobx/mobx.dart';
import 'package:ola_flutter_modular/core/models/todo.model.dart';

part 'todo.store.g.dart';

class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
  var _nextId = 3;

  @observable
  var todos = ObservableList<Todo>.of([
    const Todo(id: 1, titulo: 'Estudar MobX'),
    const Todo(id: 2, titulo: 'Estudar Flutter'),
  ]);


  @action
  void add(String titulo) {
    todos.add(Todo(id: _nextId++, titulo: titulo));
  }

  @action
  void remove(int id) {
    todos.removeWhere((todo) => todo.id == id);
  }

  @action
  Todo findById(int id) {
    return todos.firstWhere((todo) => todo.id == id);
  }

}