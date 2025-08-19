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
