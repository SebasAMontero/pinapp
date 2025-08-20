import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pinapp/src/core/app_constants/app_constants.dart';
import 'package:pinapp/src/data/models/pin_comment_model.dart';
import 'package:pinapp/src/data/models/pin_post_model.dart';
import 'package:pinapp/src/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final http.Client client;

  PostRepositoryImpl({http.Client? client}) : client = client ?? http.Client();

  @override
  Future<List<PinPostModel>> getPinPostList({
    int page = 1,
    int limit = 10,
  }) async {
    try {
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
        throw Exception(
          'Error fetching posts: ${response.statusCode} ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      throw Exception('Error fetching posts: $e');
    }
  }

  @override
  Future<List<PinCommentModel>> getPinPostCommentsById({
    required int postId,
  }) async {
    try {
      final response = await client.get(
        Uri.parse(
          '${ApiConstants.baseUrl}${ApiConstants.endpointComments(postId)}',
        ),
        headers: {'Accept': 'application/json', 'User-Agent': 'FlutterApp'},
      );

      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        return data.map((json) => PinCommentModel.fromJson(json)).toList();
      } else {
        throw Exception(
          'Error fetching posts: ${response.statusCode} ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      throw Exception('Error fetching posts: $e');
    }
  }
}
