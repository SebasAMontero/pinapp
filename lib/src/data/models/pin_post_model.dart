import 'package:pinapp/src/domain/entities/pin_post.dart';

class PinPostModel extends PinPost {
  const PinPostModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.body,
    super.isLiked = false,
  });

  factory PinPostModel.fromJson(Map<String, dynamic> json) {
    return PinPostModel(
      id: json['id'] ?? 0,
      userId: json['userId'] ?? 0,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'userId': userId, 'title': title, 'body': body};
  }

  PinPostModel copyWith({
    int? id,
    int? userId,
    String? title,
    String? body,
    bool? isLiked,
  }) {
    return PinPostModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
