import '../models/todo.dart';
import '../services/INetworkService.dart';

class Repository {
  final INetworkRepository networkRepository;

  Repository({required this.networkRepository});
  Future<List<Todo>> fetchTodos() async {
    final todosRaw = await networkRepository.fetchTodos();
    return todosRaw.map((e) => Todo.fromMap(e)).toList();
  }
}
