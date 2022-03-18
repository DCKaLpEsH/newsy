import 'package:flutter/material.dart';

class ArticleListingScreen extends StatefulWidget {
  const ArticleListingScreen({Key? key}) : super(key: key);

  @override
  State<ArticleListingScreen> createState() => ArticleListingScreenState();
}

class ArticleListingScreenState extends State<ArticleListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Artciles for category",
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
