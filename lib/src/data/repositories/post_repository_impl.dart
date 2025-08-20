import 'package:pinapp/src/data/datasource/native_comments_data_source.dart';
import 'package:pinapp/src/data/datasource/remote_post_data_source.dart';
import 'package:pinapp/src/data/models/pin_comment_model.dart';
import 'package:pinapp/src/data/models/pin_post_model.dart';
import 'package:pinapp/src/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final NativeCommentsDataSource nativeCommentsDataSource;
  final RemotePostDataSource remotePostDataSource;

  PostRepositoryImpl({
    required this.remotePostDataSource,
    required this.nativeCommentsDataSource,
  });

  @override
  Future<List<PinPostModel>> getPinPostList({int page = 1, int limit = 10}) {
    return remotePostDataSource.fetchPosts(page: page, limit: limit);
  }

  @override
  /// Native calls for both Android and iOS
  Future<List<PinCommentModel>> getPinPostCommentsById({
    required int postId,
  }) async {
    try {
      final List<Map<String, dynamic>> rawComments =
          await nativeCommentsDataSource.getComments(postId);
      return rawComments.map((json) => PinCommentModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Error fetching comments: $e');
    }
  }
}
