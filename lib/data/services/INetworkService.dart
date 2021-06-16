abstract class INetworkRepository {
  Future<List<dynamic>> fetchTodos();

  Future<bool> patchTodo(Map<String, String> patchObj, int? id);

  Future<Map<String, dynamic>> addTodo(Map<String, String> todoObj);
}
