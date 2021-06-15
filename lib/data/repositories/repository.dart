import '../models/todo.dart';
import '../services/INetworkService.dart';

class Repository {
  final INetworkRepository networkRepository;

  Repository({required this.networkRepository});
  Future<List<Todo>> fetchTodos() async {
    final todosRaw = await networkRepository.fetchTodos();
    return todosRaw.map((e) => Todo.fromMap(e)).toList();
  }

  Future<bool> changeCompletion(bool isCompleted, int? id) async {
    final patchObj = {"isCompleted": isCompleted.toString()};
    return await networkRepository.patchTodo(patchObj, id);
  }
}
