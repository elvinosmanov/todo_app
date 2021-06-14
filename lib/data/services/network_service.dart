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
}
