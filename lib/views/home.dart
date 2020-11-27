import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'categoryNews.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final categories = [
    'General',
    'Business',
    'Entertainment',
    'Health',
    'Science',
    'Sports',
    'Technology',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('News App'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          bottom: TabBar(
            indicatorColor: Colors.white,
            isScrollable: true,
            tabs: [
              for (final tab in categories) Tab(text: tab),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoryNews(
              newsCategory: categories[0].toLowerCase(),
            ),
            CategoryNews(
              newsCategory: categories[1].toLowerCase(),
            ),
            CategoryNews(
              newsCategory: categories[2].toLowerCase(),
            ),
            CategoryNews(
              newsCategory: categories[3].toLowerCase(),
            ),
            CategoryNews(
              newsCategory: categories[4].toLowerCase(),
            ),
            CategoryNews(
              newsCategory: categories[5].toLowerCase(),
            ),
            CategoryNews(
              newsCategory: categories[6].toLowerCase(),
            ),
          ],
        ),
      ),
    );
  }
}
