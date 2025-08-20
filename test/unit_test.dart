import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pinapp/src/data/datasource/native_comments_data_source.dart';
import 'package:pinapp/src/data/datasource/remote_post_data_source.dart';
import 'package:pinapp/src/data/models/pin_comment_model.dart';
import 'package:pinapp/src/data/models/pin_post_model.dart';
import 'package:pinapp/src/data/repositories/post_repository_impl.dart';

class MockNativeCommentsDataSource extends Mock
    implements NativeCommentsDataSource {}

class MockRemotePostDataSource extends Mock implements RemotePostDataSource {}

void main() {
  late PostRepositoryImpl repository;
  late MockNativeCommentsDataSource mockNative;
  late MockRemotePostDataSource mockRemote;

  setUp(() {
    mockNative = MockNativeCommentsDataSource();
    mockRemote = MockRemotePostDataSource();
    repository = PostRepositoryImpl(
      nativeCommentsDataSource: mockNative,
      remotePostDataSource: mockRemote,
    );
  });

  group('PostRepositoryImpl', () {
    test('getPinPostList returns list of posts', () async {
      final posts = [
        PinPostModel(id: 1, title: 'Test Post', body: 'Body', userId: 1),
      ];
      when(
        () => mockRemote.fetchPosts(page: 1, limit: 10),
      ).thenAnswer((_) async => posts);

      final result = await repository.getPinPostList(page: 1, limit: 10);

      expect(result, posts);
      verify(() => mockRemote.fetchPosts(page: 1, limit: 10)).called(1);
    });

    test('getPinPostCommentsById returns list of comments', () async {
      final comments = [
        {
          'postId': 1,
          'id': 1,
          'name': 'Test',
          'email': 'a@b.com',
          'body': 'Comment',
        },
      ];
      when(() => mockNative.getComments(1)).thenAnswer((_) async => comments);

      final result = await repository.getPinPostCommentsById(postId: 1);

      expect(result, isA<List<PinCommentModel>>());
      expect(result.first.body, 'Comment');
      verify(() => mockNative.getComments(1)).called(1);
    });
  });
}
