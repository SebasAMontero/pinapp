import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pinapp/src/core/app_constants/api_constants.dart';
import 'package:pinapp/src/data/models/pin_post_model.dart';

class RemotePostDataSource {
  final http.Client client;

  RemotePostDataSource({http.Client? client})
    : client = client ?? http.Client();

  /// Fetches posts
  Future<List<PinPostModel>> fetchPosts({int page = 1, int limit = 10}) async {
    final response = await client.get(
      Uri.parse(
        '${ApiConstants.baseUrl}${ApiConstants.endpointPosts}?_page=$page&_limit=$limit',
      ),
      headers: {'Accept': 'application/json', 'User-Agent': 'FlutterApp'},
    );

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((json) => PinPostModel.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching posts: ${response.statusCode}');
    }
  }
}
