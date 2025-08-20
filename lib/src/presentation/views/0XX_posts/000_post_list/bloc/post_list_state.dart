part of 'post_list_bloc.dart';

class PostListState {
  final bool isLoading;
  final List<PinPostModel> pinPosts;
  final List<PinCommentModel> pinComments;
  final bool hasError;
  final int currentPage;
  final bool hasMore;

  PostListState({
    this.isLoading = false,
    this.pinPosts = const [],
    this.pinComments = const [],
    this.hasError = false,
    this.currentPage = 1,
    this.hasMore = true,
  });

  PostListState copyWith({
    bool? isLoading,
    List<PinPostModel>? pinPosts,
    List<PinCommentModel>? pinComments,
    bool? hasError,
    int? currentPage,
    bool? hasMore,
  }) {
    return PostListState(
      pinPosts: pinPosts ?? this.pinPosts,
      pinComments: pinComments ?? this.pinComments,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
    );
  }
}
