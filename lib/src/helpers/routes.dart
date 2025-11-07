import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/pages/category/categoryPage.dart';
import 'package:flutter_news_app/src/pages/homePage/homePage.dart';
import 'package:flutter_news_app/src/pages/newsApp.dart';
import 'package:flutter_news_app/src/pages/newsDetail/newsDetailPage.dart';
import 'package:flutter_news_app/src/pages/profile/profilePage.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => const NewsApp(),
      '/home': (context) => const HomePage(),
      '/detail': (context) => const NewsDetailPage(),
      '/category': (context) => CategoryPage(controller: PageController()),
      '/profile': (context) => const ProfilePage(),
    };
  }
}
