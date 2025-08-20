import 'package:flutter/material.dart';
import 'package:pinapp/src/core/app_constants/app_constants.dart';
import 'package:pinapp/src/data/models/pin_post_model.dart';

class PostHeader extends StatelessWidget {
  final PinPostModel post;
  final VoidCallback onLikePressed;

  const PostHeader({
    super.key,
    required this.post,
    required this.onLikePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          post.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ColorConstants.accentLight,
          ),
        ),
        const SizedBox(height: 10),
        Text(post.body),
        const SizedBox(height: 10),
        Center(
          child: IconButton(
            icon: Icon(
              post.isLiked ? Icons.favorite : Icons.favorite_border,
              color: post.isLiked ? Colors.red : Colors.grey,
              size: 32,
            ),
            onPressed: onLikePressed,
          ),
        ),
      ],
    );
  }
}
