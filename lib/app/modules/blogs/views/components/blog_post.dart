import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../utils/responsive.dart';

class BlogPostCard extends StatelessWidget {
  final Blog blog;
  const BlogPostCard({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.78,
            child: Image.asset(blog.image!),
          ),
          Container(
            padding: EdgeInsets.all(kDefaultPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Design".toUpperCase(),
                      style: TextStyle(
                        color: theme.colorScheme.scrim,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: kDefaultPadding),
                    Text(
                      blog.date!,
                      style: theme.textTheme.labelSmall,
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: Text(
                    blog.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: Responsive.isDesktop(context) ? 32 : 24,
                      fontFamily: "Raleway",
                      color: theme.colorScheme.scrim,
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  blog.description!,
                  maxLines: 4,
                  style: TextStyle(height: 1.5),
                ),
                SizedBox(height: kDefaultPadding),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        padding: EdgeInsets.only(bottom: kDefaultPadding / 4),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: theme.colorScheme.primary, width: 3),
                          ),
                        ),
                        child: Text(
                          "Read More",
                          style: TextStyle(color: theme.colorScheme.scrim),
                        ),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon:
                          SvgPicture.asset("assets/icons/feather_share-2.svg"),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Blog {
  final String? date, title, description, image;

  Blog({this.date, this.title, this.description, this.image});
}

List<Blog> blogPosts = [
  Blog(
    date: "23 September 2020",
    image: "assets/images/2.png",
    title: "8 Waterfalls in Jaipur to visit this year",
    description: "Top 10 best places to visit Chandigarh in 2025...",
  ),
  Blog(
    date: "23 September 2020",
    image: "assets/images/0.png",
    title: "Cities near Agra",
    description: "Agra, a city renowned for its iconic Taj Mahal,...",
  ),
  Blog(
    date: "21 August  2020",
    image: "assets/images/1.png",
    title: "Temples in Agra to visit in 2025",
    description: "Agra is a historic city. Its mentioned in records...",
  ),
  Blog(
    date: "23 September 2020",
    image: "assets/images/0.png",
    title: "Best places to visit in Jodhpur in 2 days",
    description: "Jodhpur is Rajasthan 2nd biggest city, and you can...",
  ),
];
