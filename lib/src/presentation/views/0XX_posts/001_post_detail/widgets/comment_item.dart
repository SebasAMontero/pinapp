import 'package:flutter/material.dart';
import 'package:pinapp/src/data/models/pin_comment_model.dart';

class CommentItem extends StatelessWidget {
  final PinCommentModel comment;

  const CommentItem({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            comment.name,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 4),

          Text(
            comment.body,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
          const SizedBox(height: 6),

          Align(
            alignment: Alignment.centerRight,
            child: Text(
              comment.email,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
