import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/responsive.dart';
import '../../shared/views/main/main_screen.dart';
import '../controllers/blogs_controller.dart';
import 'components/blog_post.dart';
import 'components/recent_posts.dart';
import 'components/search.dart';

class BlogsView extends GetView<BlogsController> {
  const BlogsView({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MainScreen(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: List.generate(
                blogPosts.length,
                (index) => BlogPostCard(blog: blogPosts[index]),
              ),
            ),
          ),
          if (!Responsive.isMobile(context)) SizedBox(width: kDefaultPadding),
          // Sidebar
          if (!Responsive.isMobile(context))
            Expanded(
              child: Column(
                children: [
                  Search(),
                  SizedBox(height: kDefaultPadding),
                  RecentPosts(),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
