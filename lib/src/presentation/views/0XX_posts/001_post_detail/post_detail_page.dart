import 'package:flutter/material.dart';
import 'package:pinapp/src/data/models/pin_post_model.dart';
import 'package:pinapp/src/presentation/views/0XX_posts/001_post_detail/post_detail_view.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({super.key, required this.post});

  final PinPostModel post;

  @override
  Widget build(BuildContext context) {
    return PostDetailView(post: post);
  }
}
