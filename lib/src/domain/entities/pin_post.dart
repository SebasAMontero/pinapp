class PinPost {
  final int id;
  final int userId;
  final String title;
  final String body;

  const PinPost({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  PinPost copyWith({int? id, int? userId, String? title, String? body}) {
    return PinPost(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
