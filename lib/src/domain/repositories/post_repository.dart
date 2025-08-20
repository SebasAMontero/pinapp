import 'package:pinapp/src/data/models/pin_comment_model.dart';
import 'package:pinapp/src/data/models/pin_post_model.dart';

abstract class PostRepository {
  Future<List<PinPostModel>> getPinPostList({int page = 1, int limit = 10});
  Future<List<PinCommentModel>> getPinPostCommentsById({required int postId});
}
