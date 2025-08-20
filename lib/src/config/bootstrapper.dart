import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinapp/src/data/datasource/native_comments_data_source.dart';
import 'package:pinapp/src/data/datasource/remote_post_data_source.dart';
import 'package:pinapp/src/data/repositories/post_repository_impl.dart';
import 'package:pinapp/src/presentation/views/0XX_posts/000_post_list/bloc/post_list_bloc.dart';

class Bootstrapper {
  static List<BlocProvider> initBlocs() {
    final nativeCommentsDataSource = NativeCommentsDataSource();
    final remotePostDataSource = RemotePostDataSource();

    final postRepository = PostRepositoryImpl(
      nativeCommentsDataSource: nativeCommentsDataSource,
      remotePostDataSource: remotePostDataSource,
    );

    return [
      BlocProvider<PostListBloc>(
        create: (_) =>
            PostListBloc(postRepository: postRepository)
              ..add(GetPostListEvent()),
      ),
    ];
  }
}
