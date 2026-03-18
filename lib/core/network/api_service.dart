import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:post_vault/core/network/webService/apiConstant.dart';

class ApiService {
  final client = http.Client();

  Future<List<dynamic>> fetchPosts() async {
    final response = await client.get(Uri.parse(ApiConstant.userPost),
      headers: {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)',
        'Accept': 'application/json',
      },
    );
    print('Status Code: ${response.statusCode}');
    print('Body: ${response.body}');

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as List<dynamic>;
    } else {
      throw Exception("Failed to load posts");
    }
  }
}