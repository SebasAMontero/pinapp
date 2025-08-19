part of 'post_list_bloc.dart';

class PostListState {
  final bool isLoading;
  final List<PinPostModel> pinPosts;
  final bool hasError;

  PostListState({
    this.isLoading = true,
    this.pinPosts = const [],
    this.hasError = false,
  });

  PostListState copyWith({
    bool? isLoading,
    List<PinPostModel>? pinPosts,
    bool? hasError,
  }) {
    return PostListState(
      pinPosts: pinPosts ?? this.pinPosts,

      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }
}
