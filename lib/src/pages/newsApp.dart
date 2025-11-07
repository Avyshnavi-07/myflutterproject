import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/commonWidget/bottomNavigationBar.dart';
import 'VideoNews/videoNewsPage.dart';
import 'category/categoryPage.dart';
import 'homePage/homePage.dart';
import 'profile/profilePage.dart';

class NewsApp extends StatefulWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget(controller: _controller),
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(), // optional
        children: [
          const HomePage(),
          const VideoNewsPage(),
          CategoryPage(controller: _controller), // ✅ fixed
          const ProfilePage(),
        ],
      ),
    );
  }
}
