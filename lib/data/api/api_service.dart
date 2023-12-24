import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:suitmedia_assignment/data/model/userlist.dart' as list;

class ApiService {
  final String baseUrl = 'https://reqres.in/api';
  final String listUrl = '/users';

  Future<list.ListUser> listAPI(http.Client client, int page) async {
    final response = await client.get(Uri.parse("$baseUrl$listUrl?page=$page"));
    if (response.statusCode == 200) {
      return list.ListUser.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user list');
    }
  }
}
