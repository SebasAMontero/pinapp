part of 'post_detail_bloc.dart';

class PostDetailState {
  final bool isLoading;
  final List<PinCommentModel> pinComments;
  final bool hasError;

  PostDetailState({
    this.isLoading = true,
    this.pinComments = const [],
    this.hasError = false,
  });

  PostDetailState copyWith({
    bool? isLoading,
    List<PinCommentModel>? pinComments,
    bool? hasError,
  }) {
    return PostDetailState(
      pinComments: pinComments ?? this.pinComments,

      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }
}
