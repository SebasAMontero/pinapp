import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinapp/src/data/models/pin_comment_model.dart';
import 'package:pinapp/src/data/models/pin_post_model.dart';
import 'package:pinapp/src/domain/repositories/post_repository.dart';

part 'post_detail_event.dart';
part 'post_detail_state.dart';

class PostDetailBloc extends Bloc<PostDetailEvent, PostDetailState> {
  final PostRepository _postRepository;

  PostDetailBloc({required PostRepository postRepository})
    : _postRepository = postRepository,
      super(PostDetailState()) {
    on<GetPostCommentEvent>(_fetchPostDetail);
  }

  Future<void> _fetchPostDetail(
    GetPostCommentEvent event,
    Emitter<PostDetailState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final pinPostId = event.pinPost.id;
      final pinComments = await _postRepository.getPinPostCommentsById(
        postId: pinPostId,
      );

      emit(
        state.copyWith(
          pinComments: pinComments,
          hasError: false,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(hasError: true, isLoading: false));
    }
  }
}
