import '../models/todo.dart';
import '../services/INetworkService.dart';

class Repository {
  final INetworkRepository _networkRepository;

  Repository({required networkRepository})
      : _networkRepository = networkRepository;
  Future<List<Todo>> fetchTodos() async {
    final todosRaw = await _networkRepository.fetchTodos();
    return todosRaw.map((e) => Todo.fromMap(e)).toList();
  }

  Future<bool> changeCompletion(bool isCompleted, int? id) async {
    final patchObj = {"isCompleted": isCompleted.toString()};
    return await _networkRepository.patchTodo(patchObj, id);
  }

  Future<Todo?> addTodo(String message) async {
    final todoObj = {"todoMessage": message, "isCompleted": "false"};

    final Map<String, dynamic> todoMap =
        await _networkRepository.addTodo(todoObj);
    if (todoMap.isEmpty) return null;
    return Todo.fromMap(todoMap);
  }
}
