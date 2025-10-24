import 'package:flutter_infinite_list/posts/models/post.dart';

abstract class PostDetailRepo {
  Future<Post?> fetchPost(int id);
}
