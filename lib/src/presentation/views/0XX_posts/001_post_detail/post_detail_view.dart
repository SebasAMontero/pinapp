import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinapp/src/core/app_constants/app_constants.dart';
import 'package:pinapp/src/data/models/pin_comment_model.dart';
import 'package:pinapp/src/data/models/pin_post_model.dart';
import 'package:pinapp/src/presentation/views/0XX_posts/001_post_detail/bloc/post_detail_bloc.dart';

class PostDetailView extends StatelessWidget {
  final PinPostModel post;

  const PostDetailView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    context.read<PostDetailBloc>().add(GetPostCommentEvent(pinPost: post));

    return Scaffold(
      appBar: AppBar(
        title: Text('${StringConstants.postCommentTitle} ${post.id}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(post.body),
            const SizedBox(height: 20),

            const Text(
              StringConstants.comments,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<PostDetailBloc, PostDetailState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state.hasError) {
                    return const Center(
                      child: Text(
                        'Ocurrió un error al cargar los comentarios',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  } else if (state.pinComments.isEmpty) {
                    return const Center(child: Text('No hay comentarios'));
                  }

                  return ListView.separated(
                    itemCount: state.pinComments.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      final PinCommentModel comment = state.pinComments[index];
                      return ListTile(
                        title: Text(comment.name),
                        subtitle: Text(comment.body),
                        trailing: Text(comment.email),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
