// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen();

  @override
  _NewsFeedScreenState createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  List<Map<String, String>> _newsItems = [];

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    final response = await http.get(Uri.parse('https://feeds.simplecast.com/54nAGcIl'));
    if (response.statusCode == 200) {
      final xmlDoc = xml.XmlDocument.parse(response.body);
      final List<xml.XmlElement> itemElements = xmlDoc.findAllElements('item').toList();
      final List<Map<String, String>> newsItems = [];
      for (final itemElement in itemElements) {
        final titleElement = itemElement.findElements('title').singleOrNull;
        final linkElement = itemElement.findElements('link').singleOrNull;
        final pubDateElement = itemElement.findElements('pubDate').singleOrNull;
        final title = titleElement?.text ?? '';
        final link = linkElement?.text ?? '';
        final pubDate = pubDateElement?.text ?? '';
        newsItems.add({'title': title, 'link': link, 'pubDate': pubDate});
      }
      setState(() {
        _newsItems = newsItems;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: ListView.builder(
        itemCount: _newsItems.length,
        itemBuilder: (context, index) {
          final item = _newsItems[index];
          return ListTile(
            title: Text(item['title'] ?? ''),
            subtitle: Text(item['pubDate'] ?? ''),
            onTap: () {
              // Handle item tap
            },
          );
        },
      ),
    );
  }
}
