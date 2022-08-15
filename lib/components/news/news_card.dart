import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final String url;

  const NewsCard(
      {super.key,
      required this.title,
      required this.description,
      required this.image,
      required this.url});

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(this.url);

    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          image != '' ? Image.network(image) : Container(),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        title,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 16, 0),
                      child: Text(
                        description,
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      )),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: _launchUrl,
                      child: const Text('Go to news page'),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  factory NewsCard.fromJson(Map<String, dynamic> json) {
    return NewsCard(
      title: json['title'],
      description: json['description'],
      image: json['urlToImage'] ?? '',
      url: json['url'],
    );
  }
}
