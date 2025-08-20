import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinapp/src/core/app_constants/app_constants.dart';
import 'package:pinapp/src/data/models/pin_post_model.dart';
import 'package:pinapp/src/presentation/views/0XX_posts/000_post_list/bloc/post_list_bloc.dart';
import 'package:pinapp/src/presentation/views/0XX_posts/000_post_list/widgets/post_card.dart';

class PostsList extends StatelessWidget {
  final String searchQuery;
  final void Function(PinPostModel post) onPostTap;
  final ScrollController? scrollController;

  const PostsList({
    super.key,
    required this.searchQuery,
    required this.onPostTap,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostListBloc, PostListState>(
      builder: (context, state) {
        if (state.isLoading && state.pinPosts.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.hasError && state.pinPosts.isEmpty) {
          return Center(
            child: Text(
              StringConstants.errorPosts,
              style: const TextStyle(color: Colors.red),
            ),
          );
        } else if (state.pinPosts.isEmpty) {
          return const Center(child: Text(StringConstants.emptyPosts));
        }

        final filteredPosts = state.pinPosts
            .where(
              (post) =>
                  post.title.toLowerCase().contains(searchQuery.toLowerCase()),
            )
            .toList();

        return ListView.builder(
          controller: scrollController,
          padding: const EdgeInsets.all(DimensionsConstants.paddingMedium),
          itemCount: state.hasMore
              ? filteredPosts.length + 1
              : filteredPosts.length,
          itemBuilder: (context, index) {
            if (index >= filteredPosts.length) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Center(child: CircularProgressIndicator()),
              );
            }

            final post = filteredPosts[index];
            return PostCard(post: post, onTap: () => onPostTap(post));
          },
        );
      },
    );
  }
}
