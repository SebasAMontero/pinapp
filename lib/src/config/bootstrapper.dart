import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinapp/src/data/repositories/post_repository_impl.dart';
import 'package:pinapp/src/presentation/views/0XX_posts/000_post_list/bloc/post_list_bloc.dart';
import 'package:pinapp/src/presentation/views/0XX_posts/001_post_detail/bloc/post_detail_bloc.dart';

class Bootstrapper {
  static List<BlocProvider> initBlocs() {
    final postRepository = PostRepositoryImpl();
    return [
      BlocProvider<PostListBloc>(
        create: (_) =>
            PostListBloc(postRepository: postRepository)
              ..add(GetPostListEvent()),
      ),
      BlocProvider<PostDetailBloc>(
        create: (_) => PostDetailBloc(postRepository: postRepository),
      ),
    ];
  }
}
