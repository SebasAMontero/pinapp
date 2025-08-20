import 'package:flutter/material.dart';
import 'package:pinapp/src/core/app_constants/route_constants.dart';
import 'package:pinapp/src/data/models/pin_post_model.dart';
import 'package:pinapp/src/presentation/views/0XX_posts/000_post_list/post_list_page.dart';
import 'package:pinapp/src/presentation/views/0XX_posts/001_post_detail/post_detail_view.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.home:
      case RouteConstants.posts:
        return MaterialPageRoute(builder: (_) => const PostListPage());

      case RouteConstants.postDetail:
        final args = settings.arguments as Map<String, dynamic>;
        final post = args['post'] as PinPostModel;
        return MaterialPageRoute(builder: (_) => PostDetailView(post: post));

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Undefined route'))),
        );
    }
  }
}
