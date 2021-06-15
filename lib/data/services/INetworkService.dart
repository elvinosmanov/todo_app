abstract class INetworkRepository {
  Future<List<dynamic>> fetchTodos();

  Future<bool> patchTodo(Map<String, String> patchObj, int? id);
}
