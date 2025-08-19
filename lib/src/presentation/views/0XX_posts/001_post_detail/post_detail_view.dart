import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinapp/src/core/app_constants/app_constants.dart';
import 'package:pinapp/src/data/models/pin_post_model.dart';
import 'package:pinapp/src/presentation/views/0XX_posts/000_post_list/bloc/post_list_bloc.dart';
import 'package:pinapp/src/presentation/views/0XX_posts/001_post_detail/widgets/comments_list.dart';
import 'package:pinapp/src/presentation/views/0XX_posts/001_post_detail/widgets/post_header.dart';

class PostDetailView extends StatefulWidget {
  final PinPostModel post;

  const PostDetailView({super.key, required this.post});

  @override
  State<PostDetailView> createState() => _PostDetailViewState();
}

class _PostDetailViewState extends State<PostDetailView> {
  @override
  void initState() {
    super.initState();
    context.read<PostListBloc>().add(GetPostCommentEvent(pinPost: widget.post));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostListBloc, PostListState>(
      builder: (context, state) {
        // Obtener el post actualizado del estado
        final post = state.pinPosts.firstWhere(
          (p) => p.id == widget.post.id,
          orElse: () => widget.post,
        );

        return Scaffold(
          appBar: AppBar(
            title: Text('${StringConstants.postCommentTitle} ${post.id}'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(DimensionsConstants.paddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PostHeader(
                  post: post,
                  onLikePressed: () {
                    context.read<PostListBloc>().add(
                      TogglePostLikeEvent(postId: post.id),
                    );
                  },
                ),
                const SizedBox(height: 10),

                const SizedBox(height: 20),
                const Text(
                  StringConstants.comments,
                  style: TextStyle(
                    fontSize: DimensionsConstants.fontMedium,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const Expanded(child: CommentsList()),
              ],
            ),
          ),
        );
      },
    );
  }
}
