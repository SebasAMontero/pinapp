import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinapp/src/core/app_constants/app_constants.dart';
import 'package:pinapp/src/data/models/pin_post_model.dart';
import 'package:pinapp/src/presentation/views/0XX_posts/000_post_list/bloc/post_list_bloc.dart';
import 'package:pinapp/src/presentation/views/0XX_posts/000_post_list/widgets/post_search_filter.dart';
import 'package:pinapp/src/presentation/views/0XX_posts/000_post_list/widgets/posts_list.dart';

class PostListView extends StatefulWidget {
  const PostListView({super.key});

  @override
  State<PostListView> createState() => _PostListViewState();
}

class _PostListViewState extends State<PostListView> {
  final String _searchQuery = '';

  void _navigateToPostDetail(BuildContext context, PinPostModel post) {
    Navigator.pushNamed(
      context,
      RouteConstants.postDetail,
      arguments: {'post': post},
    );
  }

  // TODO Add fetch scroll
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.postsTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              final posts = context.read<PostListBloc>().state.pinPosts;
              showSearch(context: context, delegate: PostSearchFilter(posts));
            },
          ),
        ],
      ),
      body: PostsList(
        searchQuery: _searchQuery,
        onPostTap: (post) => _navigateToPostDetail(context, post),
      ),
    );
  }
}
