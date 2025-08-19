part of 'post_list_bloc.dart';

abstract class PostListEvent extends Equatable {
  const PostListEvent();

  @override
  List<Object> get props => [];
}

/// Obtains a list of [PinPostModel]
class GetPostListEvent extends PostListEvent {
  @override
  List<Object> get props => [];
}

/// Obtains a list of [PinCommentModel] from a postId.
class GetPostCommentEvent extends PostListEvent {
  const GetPostCommentEvent({required this.pinPost});
  final PinPostModel pinPost;

  @override
  List<Object> get props => [pinPost];
}

/// Toggles a Like of a [PinPostModel]
class TogglePostLikeEvent extends PostListEvent {
  final int postId;
  const TogglePostLikeEvent({required this.postId});
}
