import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinapp/src/core/app_constants/app_constants.dart';
import 'package:pinapp/src/data/models/pin_comment_model.dart';
import 'package:pinapp/src/presentation/views/0XX_posts/000_post_list/bloc/post_list_bloc.dart';
import 'package:pinapp/src/presentation/views/0XX_posts/001_post_detail/widgets/comment_item.dart';

class CommentsList extends StatelessWidget {
  const CommentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostListBloc, PostListState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.hasError) {
          return const Center(
            child: Text(
              StringConstants.commentsError,
              style: TextStyle(color: Colors.red),
            ),
          );
        } else if (state.pinComments.isEmpty) {
          return const Center(child: Text(StringConstants.emptyComments));
        }

        return ListView.separated(
          itemCount: state.pinComments.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) {
            final PinCommentModel comment = state.pinComments[index];
            return CommentItem(comment: comment);
          },
        );
      },
    );
  }
}
