import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_infinite_list/posts/posts.dart';
import 'package:flutter_infinite_list/core/routes.dart';
import 'package:go_router/go_router.dart';

class PostsList extends StatefulWidget {
  const PostsList({super.key});

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PostBloc, PostsState>(
      listenWhen: (previous, current) => current.status == PostStatus.selected,
      listener: (context, state) {
        if (state.status == PostStatus.selected) {
          context.goNamed(
            Routes.postDetail,
            pathParameters: {
              'id': state.selectedPost?.id.toString() ?? '0',
            },
          );
        }
      },
      child: BlocBuilder<PostBloc, PostsState>(
        buildWhen: (previous, current) => current.status != PostStatus.selected,
        builder: (context, state) {
          switch (state.status) {
            case PostStatus.selected:
              // it shouldn't be here, but it's a workaround to show the selected post
              return const Center(child: Text('selected post'));
            case PostStatus.failure:
              return const Center(child: Text('failed to fetch posts'));
            case PostStatus.success:
              final count = state.posts?.length ?? 0;
              if (count == 0) {
                return const Center(child: Text('no posts'));
              }
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  final post = state.posts?[index];
                  return index >= count
                      ? const BottomLoader()
                      : InkWell(
                          onTap: () {
                            context.read<PostBloc>().add(
                              PostItemClicked(post: post),
                            );
                          },
                          child: PostListItem(post: post!),
                        );
                },
                itemCount: state.hasReachedMax ? count : count + 1,
                controller: _scrollController,
              );
            case PostStatus.initial:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<PostBloc>().add(PostFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
