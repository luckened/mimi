import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'news_card.dart';

Future<Column> fetchNews() async {
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/everything?q=covid&apiKey=5963a145eb3643db93949a6f7a214df0'));
  if (response.statusCode == 200) {
    final List<dynamic> articles = jsonDecode(response.body)['articles'];

    return Column(
      children: articles.map((article) => NewsCard.fromJson(article)).toList(),
    );
  } else {
    throw Exception('Failed to load news');
  }
}

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  // @TODO: futureNews should be a list of news cards
  late Future<Column> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<Column>(
        future: futureNews,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!;
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
