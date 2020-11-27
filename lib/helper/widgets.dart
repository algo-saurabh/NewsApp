import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/views/articleView.dart';

// ignore: must_be_immutable
class NewsTile extends StatelessWidget {
  final String author, imgUrl, title, desc, postUrl;
  DateTime date;

  NewsTile(
      {this.author,
      this.imgUrl,
      this.desc,
      this.title,
      this.date,
      @required this.postUrl});

  String getDate() {
    var formatter = new DateFormat('dd MMMM yyyy h:m');
    String formatted = formatter.format(date.toUtc());
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(
              postUrl: postUrl,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 24),
        width: MediaQuery.of(context).size.width,
        child: Container(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(6),
                bottomLeft: Radius.circular(6),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: CachedNetworkImage(
                    placeholder: (context, url) => CircularProgressIndicator(),
                    imageUrl: imgUrl,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  title,
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  desc,
                  maxLines: 2,
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  author,
                  maxLines: 2,
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
                Text(
                  getDate(),
                  maxLines: 2,
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
