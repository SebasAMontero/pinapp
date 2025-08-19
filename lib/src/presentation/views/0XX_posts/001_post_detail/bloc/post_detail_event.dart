part of 'post_detail_bloc.dart';

abstract class PostDetailEvent extends Equatable {
  const PostDetailEvent();

  @override
  List<Object> get props => [];
}

/// Obtains a list of [PinCommentModel] from a postId.
class GetPostCommentEvent extends PostDetailEvent {
  const GetPostCommentEvent({required this.pinPost});
  final PinPostModel pinPost;

  @override
  List<Object> get props => [pinPost];
}
