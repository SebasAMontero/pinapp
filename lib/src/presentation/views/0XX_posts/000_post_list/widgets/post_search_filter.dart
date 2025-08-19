import 'package:flutter/material.dart';
import 'package:pinapp/src/core/app_constants/app_constants.dart';
import 'package:pinapp/src/data/models/pin_post_model.dart';
import 'package:pinapp/src/presentation/views/0XX_posts/000_post_list/widgets/post_card.dart';

class PostSearchFilter extends SearchDelegate {
  final List<PinPostModel> posts;

  PostSearchFilter(this.posts);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(icon: const Icon(Icons.clear), onPressed: () => query = ''),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  void _navigateToPostDetail(BuildContext context, PinPostModel post) {
    Navigator.pushNamed(
      context,
      RouteConstants.postDetail,
      arguments: {'post': post},
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = posts
        .where((p) => p.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final post = results[index];
        return ListTile(
          title: Text(post.title),
          subtitle: Text(
            post.body,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          onTap: () => _navigateToPostDetail,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = posts
        .where((p) => p.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final post = suggestions[index];

        return PostCard(
          post: post,
          onTap: () => _navigateToPostDetail(context, post),
        );
      },
    );
  }
}
