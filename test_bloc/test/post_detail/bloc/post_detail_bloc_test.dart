import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_infinite_list/post_detail/bloc/post_detail_bloc.dart';
import 'package:flutter_infinite_list/post_detail/bloc/post_detail_event.dart';
import 'package:flutter_infinite_list/post_detail/bloc/post_detail_state.dart';
import 'package:flutter_infinite_list/post_detail/usecases/get_post_detail_usecase.dart';
import 'package:flutter_infinite_list/posts/models/post.dart';
import 'package:flutter_test/flutter_test.dart';

import '../repo/post_detail_repo_mock.dart';

void main() {
  group('PostDetailBloc', () {
    test('initial state is PostDetailState()', () {
      final bloc = PostDetailBloc(
        getPostDetailUsecase: GetPostDetailUsecase(
          postDetailRepo: PostDetailRepoMock(),
        ),
        id: 1,
      );
      expect(bloc.state, const PostDetailStateInitial());
    });

    blocTest<PostDetailBloc, PostDetailState>(
      'emits PostDetailStateLoading when PostDetailEventFetched is added',
      build: () => PostDetailBloc(
        getPostDetailUsecase: GetPostDetailUsecase(
          postDetailRepo: PostDetailRepoMock(),
        ),
        id: 1,
      ),
      act: (bloc) => bloc.add(const PostDetailEventFetched(id: 1)),
      wait: const Duration(milliseconds: 1500), // Đợi 500ms để event hoàn thành
      expect: () => [
        isA<PostDetailStateLoading>(),
        isA<PostDetailStateSuccess>(),
      ],
      // expect: () => <PostDetailState>[
      //   const PostDetailStateLoading(),
      //   const PostDetailStateSuccess(
      //     post: Post(
      //       id: 1,
      //       title: 'mock detail title',
      //       body: 'mock detail body',
      //     ),
      //   ),
      // ],
    );
  });
}
