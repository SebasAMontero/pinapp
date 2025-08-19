part of 'post_list_bloc.dart';

class PostListState {
  final bool isLoading;
  final List<PinPostModel> pinPosts;
  final List<PinCommentModel> pinComments;
  final bool hasError;

  PostListState({
    this.isLoading = true,
    this.pinPosts = const [],
    this.pinComments = const [],
    this.hasError = false,
  });

  PostListState copyWith({
    bool? isLoading,
    List<PinPostModel>? pinPosts,
    List<PinCommentModel>? pinComments,
    bool? hasError,
  }) {
    return PostListState(
      pinPosts: pinPosts ?? this.pinPosts,
      pinComments: pinComments ?? this.pinComments,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }
}
