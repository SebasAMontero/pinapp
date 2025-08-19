import 'package:pinapp/src/domain/entities/pin_post.dart';

class PinPostModel extends PinPost {
  const PinPostModel({
    required super.id,
    required super.userId,
    required super.title,
    required super.body,
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
}
