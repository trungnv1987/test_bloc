import 'package:flutter/material.dart';
import 'package:flutter_infinite_list/app.dart';
import 'package:flutter_infinite_list/post_detail/page/post_detail_page.dart';
import 'package:flutter_infinite_list/posts/view/posts_list.dart';
import 'package:flutter_infinite_list/posts/view/posts_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PostDetailPage', () {
    testWidgets('renders PostDetailView', (tester) async {
      await tester.pumpWidget(const App()); // Sử dụng App widget có GoRouter
      // Đợi widget được render
      await tester.pump();
      // Đợi tất cả animation và timer hoàn thành với timeout
      await tester.pumpAndSettle(const Duration(seconds: 5));
      // Kiểm tra xem PostsList có tồn tại không trước khi tap
      expect(find.byType(PostsList), findsOneWidget);

      await tester.tap(find.byType(PostsList));

      // Đợi navigation hoàn thành
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Kiểm tra xem PostDetailPage có tồn tại không
      expect(find.byType(PostDetailPage), findsOneWidget);
    });
  });
}
