import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'news_card.dart';

Future<NewsCard> fetchNews() async {
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/everything?q=covid&from=2022-07-10&sortBy=publishedAt&apiKey=5963a145eb3643db93949a6f7a214df0'));
  if (response.statusCode == 200) {
    return NewsCard.fromJson(jsonDecode(response.body)['articles'][0]);
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
  late Future<NewsCard> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<NewsCard>(
        future: futureNews,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(children: [snapshot.data!, snapshot.data!]);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
