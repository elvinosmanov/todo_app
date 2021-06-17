import 'dart:async';
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
      throw Exception("There is no Network Connection");
    }
  }

  @override
  Future<bool> patchTodo(Map<String, dynamic> patchObj, int? id) async {
    try {
      await http.patch(Uri.parse(baseURl + '/todos/$id'), body: patchObj);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Map<String, dynamic>> addTodo(Map<String, dynamic> todoObj) async {
    try {
      final respond =
          await http.post(Uri.parse(baseURl + '/todos'), body: todoObj);
      Map<String, dynamic> map = jsonDecode(respond.body);
      return map;
    } catch (e) {
      return {};
    }
  }

  @override
  Future<bool> deleteTodo(int? id) async {
    try {
      await http.delete(Uri.parse(baseURl + '/todos/$id'));
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> updateTodo(Map<String, String?> updatedObj, int? id) async {
    try {
      await http.patch(Uri.parse(baseURl + '/todos/$id'), body: updatedObj);
      return true;
    } catch (e) {
      return false;
    }
  }
}
