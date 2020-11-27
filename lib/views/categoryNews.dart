import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/helper/widgets.dart';

class CategoryNews extends StatefulWidget {
  final String newsCategory;

  CategoryNews({this.newsCategory});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  var newsList;
  bool _loading = true;

  @override
  void initState() {
    getNews();
    super.initState();
  }

  void getNews() async {
    News news = News();
    await news.getNewsForCategory(widget.newsCategory);
    newsList = news.news;

    if (this.mounted) {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                child: Container(
                  margin: EdgeInsets.only(top: 16),
                  child: ListView.builder(
                    itemCount: newsList.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NewsTile(
                        author: newsList[index].author ?? "Author Not Found",
                        imgUrl: newsList[index].urlToImage ?? "Image Not Available",
                        title: newsList[index].title ?? "Title Not Found",
                        desc: newsList[index].description ?? "Description Not Found",
                        date: newsList[index].publishedAt ?? "Date not Found",
                        postUrl: newsList[index].articleUrl ?? "",
                      );
                    },
                  ),
                ),
              ),
            ),
    );
  }
}
