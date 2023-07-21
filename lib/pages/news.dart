import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;
import 'package:url_launcher/url_launcher.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

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
        title: const Text('News Feed'),
      ),
      body: NewsList(newsItems: _newsItems),
    );
  }
}

class NewsList extends StatelessWidget {
  final List<Map<String, String>> newsItems;

  const NewsList({required this.newsItems});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsItems.length,
      itemBuilder: (context, index) {
        final item = newsItems[index];
        return ListTile(
          title: Text(item['title'] ?? ''),
          subtitle: Text(item['pubDate'] ?? ''),
          onTap: () {
            _launchURL(item['link'] ?? '');
          },
        );
      },
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}
