import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinapp/src/core/app_constants/app_constants.dart';
import 'package:pinapp/src/data/models/pin_post_model.dart';
import 'package:pinapp/src/presentation/views/0XX_posts/000_post_list/bloc/post_list_bloc.dart';
import 'package:pinapp/src/presentation/views/0XX_posts/000_post_list/widgets/post_card.dart';
import 'package:pinapp/src/presentation/views/0XX_posts/000_post_list/widgets/post_search_filter.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
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
      body: BlocBuilder<PostListBloc, PostListState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.hasError) {
            return Center(
              child: Text(
                StringConstants.errorPosts,
                style: TextStyle(color: Colors.red),
              ),
            );
          } else if (state.pinPosts.isEmpty) {
            return const Center(child: Text(StringConstants.emptyPosts));
          }

          // Filtrado simple por searchQuery
          final filteredPosts = state.pinPosts
              .where(
                (post) => post.title.toLowerCase().contains(
                  _searchQuery.toLowerCase(),
                ),
              )
              .toList();

          return ListView.builder(
            itemCount: filteredPosts.length,
            padding: EdgeInsets.all(DimensionsConstants.paddingMedium),
            itemBuilder: (context, index) {
              final post = filteredPosts[index];
              return PostCard(
                post: post,
                onTap: () => _navigateToPostDetail(context, post),
              );
            },
          );
        },
      ),
    );
  }
}
