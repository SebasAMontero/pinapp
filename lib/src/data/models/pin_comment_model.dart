import 'package:pinapp/src/domain/entities/pin_comment.dart';

class PinCommentModel extends PinComment {
  const PinCommentModel({
    required super.id,
    required super.postId,
    required super.name,
    required super.body,
    required super.email,
  });

  factory PinCommentModel.fromJson(Map<String, dynamic> json) {
    return PinCommentModel(
      postId: json['postId'] as int,
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      body: json['body'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  PinCommentModel copyWith({
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body,
  }) {
    return PinCommentModel(
      postId: postId ?? this.postId,
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }
}
