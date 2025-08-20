import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pinapp/src/data/models/pin_post_model.dart';
import 'package:pinapp/src/presentation/views/0XX_posts/000_post_list/bloc/post_list_bloc.dart';
import 'package:pinapp/src/presentation/views/0XX_posts/000_post_list/post_list_view.dart';

class MockPostListBloc extends Mock implements PostListBloc {}

class FakePostListState extends Fake implements PostListState {}

class FakeGetPostListEvent extends Fake implements GetPostListEvent {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakePostListState());
    registerFallbackValue(FakeGetPostListEvent());
  });

  testWidgets('PostListView shows posts and triggers scroll loading', (
    tester,
  ) async {
    final mockBloc = MockPostListBloc();

    final initialPosts = List.generate(
      20,
      (index) => PinPostModel(
        id: index,
        userId: index,
        title: 'Post $index',
        body: 'Body $index',
        isLiked: false,
      ),
    );

    when(() => mockBloc.state).thenReturn(
      PostListState(
        pinPosts: initialPosts,
        isLoading: false,
        hasMore: true,
        currentPage: 1,
      ),
    );

    whenListen(
      mockBloc,
      Stream.value(
        PostListState(
          pinPosts: initialPosts,
          isLoading: false,
          hasMore: true,
          currentPage: 1,
        ),
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<PostListBloc>.value(
          value: mockBloc,
          child: const PostListView(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    for (var post in initialPosts.take(5)) {
      expect(find.text(post.title), findsOneWidget);
    }

    final scrollable = find.byType(Scrollable);
    await tester.fling(scrollable, const Offset(0, -500), 1000);
    await tester.pumpAndSettle();

    verify(() => mockBloc.add(any<GetPostListEvent>())).called(greaterThan(0));
  });
}
