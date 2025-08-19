import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinapp/src/data/models/pin_post_model.dart';
import 'package:pinapp/src/domain/repositories/post_repository.dart';

part 'post_list_event.dart';
part 'post_list_state.dart';

class PostListBloc extends Bloc<PostListEvent, PostListState> {
  final PostRepository _postRepository;

  PostListBloc({required PostRepository postRepository})
    : _postRepository = postRepository,
      super(PostListState()) {
    on<GetPostListEvent>(_fetchPostList);
  }

  Future<void> _fetchPostList(
    GetPostListEvent event,
    Emitter<PostListState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      final pinPosts = await _postRepository.getPinPostList();

      emit(
        state.copyWith(pinPosts: pinPosts, hasError: false, isLoading: false),
      );
    } catch (e) {
      emit(state.copyWith(hasError: true, isLoading: false));
    }
  }
}
