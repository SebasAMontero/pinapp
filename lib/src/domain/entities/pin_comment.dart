class PinComment {
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;
  const PinComment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });
  PinComment copyWith({
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body,
  }) {
    return PinComment(
      postId: postId ?? this.postId,
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }
}
