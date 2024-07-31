import 'package:mobx/mobx.dart';
import 'package:ola_flutter_modular/core/models/todo.model.dart';

import '../helpers/dio.helper.dart';

part 'todo.store.g.dart';

class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
  final _dio = DioHelper().dio();

  @observable
  var todos = ObservableList<Todo>.of([]);

  @action
  Future<void> add(String titulo) async {
    await _dio.post('/todos', data: {"titulo": titulo});
  }

  @action
  Future<void> remove(String id) async {
    await _dio.delete('/todos/$id');
  }

  @action
  Todo findById(String id) {
    return todos.firstWhere((todo) => todo.id == id);
  }

  @action
  Future<void> fetchTodos() async {
    final response = await _dio.get('/todos');
    todos.clear();
    var todosAPI = (response.data as List).map((json) => Todo.fromJson(json));
    todos.addAll(todosAPI);
  }

}
