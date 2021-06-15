import 'dart:convert';

import 'package:http/http.dart' as http;

import 'INetworkService.dart';

class NetworkRepository extends INetworkRepository {
  final baseURl = "http://localhost:3000";

  @override
  Future<List<dynamic>> fetchTodos() async {
    try {
      final response = await http.get(Uri.parse(baseURl + '/todos'));
      return jsonDecode(response.body) as List;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<bool> patchTodo(Map<String, String> patchObj, int? id) async {
    try {
      await http.patch(Uri.parse(baseURl + '/todos/$id'), body: patchObj);
      return true;
    } catch (e) {
      return false;
    }
  }
}
