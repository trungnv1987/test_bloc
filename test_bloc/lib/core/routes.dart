import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_infinite_list/posts/posts.dart';
import 'package:flutter_infinite_list/post_detail/page/post_detail_page.dart';

class Routes {
  static const String posts = '/';
  static const String postDetail = '/post-detail';
}

// Custom page transitions
class SlideTransitionPage extends CustomTransitionPage<void> {
  const SlideTransitionPage({
    required super.child,
    required super.key,
    super.name,
    super.arguments,
    super.restorationId,
  }) : super(
         transitionsBuilder: _slideTransition,
         transitionDuration: const Duration(milliseconds: 300),
         reverseTransitionDuration: const Duration(milliseconds: 300),
       );

  static Widget _slideTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: animation.drive(
        Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOut)),
      ),
      child: child,
    );
  }
}

class FadeTransitionPage extends CustomTransitionPage<void> {
  const FadeTransitionPage({
    required super.child,
    required super.key,
    super.name,
    super.arguments,
    super.restorationId,
  }) : super(
         transitionsBuilder: _fadeTransition,
         transitionDuration: const Duration(milliseconds: 250),
         reverseTransitionDuration: const Duration(milliseconds: 250),
       );

  static Widget _fadeTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: animation.drive(
        Tween<double>(begin: 0.0, end: 1.0).chain(
          CurveTween(curve: Curves.easeInOut),
        ),
      ),
      child: child,
    );
  }
}

class ScaleTransitionPage extends CustomTransitionPage<void> {
  const ScaleTransitionPage({
    required super.child,
    required super.key,
    super.name,
    super.arguments,
    super.restorationId,
  }) : super(
         transitionsBuilder: _scaleTransition,
         transitionDuration: const Duration(milliseconds: 300),
         reverseTransitionDuration: const Duration(milliseconds: 300),
       );

  static Widget _scaleTransition(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return ScaleTransition(
      scale: animation.drive(
        Tween<double>(begin: 0.8, end: 1.0).chain(
          CurveTween(curve: Curves.elasticOut),
        ),
      ),
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}

final GoRouter router = GoRouter(
  initialLocation: Routes.posts,
  routes: [
    GoRoute(
      path: Routes.posts,
      name: Routes.posts,
      pageBuilder: (context, state) => FadeTransitionPage(
        key: state.pageKey,
        child: const PostsPage(),
      ),
    ),
    GoRoute(
      path: '${Routes.postDetail}/:id',
      name: Routes.postDetail,
      pageBuilder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return SlideTransitionPage(
          key: state.pageKey,
          child: PostDetailPage(postId: id),
        );
      },
    ),
  ],
);
