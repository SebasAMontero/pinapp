import 'package:flutter/material.dart';
import 'package:pinapp/src/core/app_constants/app_constants.dart';
import 'package:pinapp/src/data/models/pin_post_model.dart';

class PostCard extends StatelessWidget {
  final PinPostModel post;
  final VoidCallback? onTap;

  const PostCard({super.key, required this.post, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        title: Text(
          post.title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: ColorConstants.accent,
          ),
        ),
        trailing: Icon(
          post.isLiked ? Icons.favorite : Icons.favorite_border,
          color: post.isLiked ? Colors.red : Colors.grey,
        ),
        subtitle: Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis),
        onTap: onTap,
      ),
    );
  }
}
