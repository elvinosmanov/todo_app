abstract class INetworkRepository {
  Future<List<dynamic>> fetchTodos();

  Future<bool> patchTodo(Map<String, dynamic> patchObj, int? id);

  Future<Map<String, dynamic>> addTodo(Map<String, dynamic> todoObj);

  Future<bool> deleteTodo(int? id);

  Future<bool> updateTodo(Map<String, String?> updatedObj, int? id);
}
